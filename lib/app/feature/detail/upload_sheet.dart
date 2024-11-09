import 'package:flutter/material.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload__image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UploadSheet extends StatelessWidget {
  final String side;
  final int index;

  const UploadSheet({super.key, required this.side, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: Text('작품 업로드 및 선택하기'),
      description: Text("${index + 1}번째 영역 이미지"),
      actions: [
        ShadButton(
          child: Text('저장'),
          onPressed: () {
            DetailController.to.saveImage(context, index, "sfdsfs");
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "작품 업로드",
                style: ShadTheme.of(context).textTheme.p,
              ),
              UploadImage(
                isEditable: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
