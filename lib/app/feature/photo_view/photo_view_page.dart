import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({Key? key, required this.photos}) : super(key: key);

  final List<String> photos;

  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  bool isLoading = false;

  Future<File> combineImages(List<String> imageUrls) async {
    if (imageUrls.length != 4) {
      throw ArgumentError('이미지 URL은 정확히 4개여야 합니다.');
    }

    List<Future<img.Image>> imageFutures = imageUrls.map((url) async {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final image = img.decodeImage(response.bodyBytes);
        if (image != null) {
          return image;
        } else {
          throw Exception('이미지를 디코딩하는 데 실패했습니다: $url');
        }
      } else {
        throw Exception('이미지를 다운로드하는 데 실패했습니다: $url');
      }
    }).toList();

    List<img.Image> images = await Future.wait(imageFutures);

    int desiredWidth = 200;
    int desiredHeight = 200;
    for (int i = 0; i < images.length; i++) {
      images[i] =
          img.copyResize(images[i], width: desiredWidth, height: desiredHeight);
    }

    final combinedImage =
        img.Image(width: desiredWidth * 2, height: desiredHeight * 2);
    img.fill(combinedImage, color: img.ColorFloat16(0));

    img.compositeImage(combinedImage, images[0], dstX: 0, dstY: 0); // 왼쪽 위
    img.compositeImage(combinedImage, images[1],
        dstX: desiredWidth, dstY: 0); // 오른쪽 위
    img.compositeImage(combinedImage, images[2],
        dstX: 0, dstY: desiredHeight); // 왼쪽 아래
    img.compositeImage(combinedImage, images[3],
        dstX: desiredWidth, dstY: desiredHeight); // 오른쪽 아래

    final combinedBytes = img.encodePng(combinedImage);

    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/combined_image.png';
    final file = File(filePath);
    await file.writeAsBytes(combinedBytes);

    return file;
  }

  Future<void> share() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final merged = await combineImages(widget.photos);
    setState(() {
      isLoading = false;
    });
    await Share.shareXFiles(
      [XFile.fromData(merged.readAsBytesSync())],
      fileNameOverrides: ["나뭇잎.png"],
    );
  }

  Future<void> save() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final merged = await combineImages(widget.photos);

    await merged.copy(
      '${(await getTemporaryDirectory()).path}/merged_image.png',
    );
    setState(() {
      isLoading = false;
    });
    RouterService.to.showSimpleToast('저장되었습니다!');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.getWidth,
            height: context.getHeight,
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ECachedImage(
                          imageUrl: widget.photos[0],
                        ),
                      ),
                      Expanded(
                        child: ECachedImage(
                          imageUrl: widget.photos[1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ECachedImage(
                          imageUrl: widget.photos[2],
                        ),
                      ),
                      Expanded(
                        child: ECachedImage(
                          imageUrl: widget.photos[3],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 45,
                  height: 45,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: SafeArea(
              child: GestureDetector(
                onTap: save,
                child: Container(
                  width: 45,
                  height: 45,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.save_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 65,
            child: SafeArea(
              child: GestureDetector(
                onTap: share,
                child: Container(
                  width: 45,
                  height: 45,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (isLoading)
            Positioned(
              top: 80,
              left: 24,
              right: 24,
              child: SafeArea(
                child: ShadProgress(
                  minHeight: 5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
