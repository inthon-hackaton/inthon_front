import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload_sheet_other_item.dart';
import 'package:lottie/lottie.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UploadSheet extends StatefulWidget {
  const UploadSheet({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _UploadSheetState createState() => _UploadSheetState();
}

class _UploadSheetState extends State<UploadSheet> {
  int pieceId = 0;
  String profile = "";
  String name = "";
  String pieceUrl = "";
  XFile? image;

  void pickImage() async {
    final selectedImage = await DetailController.to.pickImage();
    setState(() {
      image = selectedImage;
    });
  }

  void save() async {
    if (image != null) {
      DetailController.to.selectMyImage(widget.index, image);
    } else if (pieceId == 0) {
      return;
    } else {
      DetailController.to.selectOtherImage(
        widget.index,
        pieceUrl,
        profile,
        name,
        pieceId,
      );
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: BoxConstraints(maxHeight: 600),
      title: Text('${widget.index + 1}번째 영역 이미지'),
      description: Text("내 작품을 업로드하거나, 타인의 작품을 선택할 수 있어요."),
      actions: [
        ShadButton(
          child: Text('선택'),
          onPressed: () {
            save();
          },
        ),
      ],
      child: Column(
        children: [
          SizedBox(height: 10),
          Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Align(
                    child: Text(
                      "내 작품 업로드",
                      style: ShadTheme.of(context).textTheme.large,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: DottedBorder(
                        color: context.getColorScheme.primary,
                        strokeWidth: 1.5,
                        dashPattern: [6, 3],
                        child: image == null
                            ? Center(
                                child: Icon(
                                  Icons.add,
                                  color: context.getColorScheme.primary
                                      .withOpacity(0.8),
                                  size: 26,
                                ),
                              )
                            : Image.file(
                                File(image!.path),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(height: 30, color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("또는",
                              style: ShadTheme.of(context).textTheme.small),
                        ),
                        Expanded(
                            child: Divider(height: 30, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Text(
                    "타인의 작품 선택",
                    style: ShadTheme.of(context).textTheme.large,
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    final pieces = DetailController.to.pieces
                        .where((p) => p.piece_number == widget.index + 1)
                        .toList();
                    if (pieces.isEmpty) {
                      return Column(
                        children: [
                          LottieBuilder.asset(
                            width: 50,
                            "assets/empty_cat.json",
                          ),
                          SizedBox(height: 10),
                          Text(
                            "아직 등록된 조각이 없어요.",
                            style: context.getTextTheme.muted,
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        for (final piece in pieces)
                          UploadSheetOtherItem(
                            piece: piece,
                          ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
