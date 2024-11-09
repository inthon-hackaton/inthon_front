import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload_image.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload_sheet_other_item.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UploadSheet extends StatelessWidget {
  final int index;

  const UploadSheet({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: BoxConstraints(maxHeight: 600),
      title: Text('${index + 1}번째 영역 이미지'),
      description: Text("내 작품을 업로드하거나, 타인의 작품을 선택할 수 있어요."),
      actions: [
        ShadButton(
          child: Text('저장'),
          onPressed: () {
            DetailController.to.saveImage(index, "sfdsfs");
            context.pop();
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
                  UploadImage(),
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
                  Column(
                    children: [
                      UploadSheetOtherItem(isSelected: true),
                      UploadSheetOtherItem(isSelected: false),
                      UploadSheetOtherItem(isSelected: false),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
