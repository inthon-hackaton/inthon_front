import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload__image.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UploadSheet extends StatelessWidget {
  final int index;

  const UploadSheet({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      title: Text('작품 업로드 및 선택하기'),
      description: Text("${index + 1}번째 영역 이미지"),
      actions: [
        ShadButton(
          child: Text('저장'),
          onPressed: () {
            DetailController.to.saveImage(index, "sfdsfs");
            context.pop();
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "작품 업로드",
              style: ShadTheme.of(context).textTheme.large,
            ),
            SizedBox(height: 10),
            UploadImage(
              isEditable: true,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
