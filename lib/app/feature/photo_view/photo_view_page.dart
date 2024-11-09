import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zoom_widget/zoom_widget.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({Key? key}) : super(key: key);

  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  Future<void> share() async {
    await Share.share('check out my website https://example.com');
  }

  Future<void> save() async {
    // final image1 = decodeImage(File('imageA.jpg').readAsBytesSync());
    // final image2 = decodeImage(File('imageB.jpg').readAsBytesSync());
    // final mergedImage =
    //     Image(image1.width + image2.width, max(image1.height, image2.height));
    // copyInto(mergedImage, image1, blend = false);
    // copyInto(mergedImage, image2, dstx = image1.width, blend = false);

    // final documentDirectory = await getApplicationDocumentsDirectory();
    // final file = new File(join(documentDirectory.path, "merged_image.jpg"));
    // file.writeAsBytesSync(encodeJpg(mergedImage));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Zoom(
          initTotalZoomOut: true,
          backgroundColor: Colors.black,
          scrollWeight: 5.0,
          child: CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1517219039361-66f283bce5db?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D",
          ),
        ),
        // PhotoView(
        //   imageProvider: CachedNetworkImageProvider(
        //     "https://images.unsplash.com/photo-1517219039361-66f283bce5db?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D",
        //   ),
        // ),
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
      ],
    );
  }
}
