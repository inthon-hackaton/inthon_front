import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/logic/mypage_controller.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/widget/mypage_profile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MypageEditDialog extends StatefulWidget {
  const MypageEditDialog({Key? key}) : super(key: key);

  @override
  _MypageEditDialogState createState() => _MypageEditDialogState();
}

class _MypageEditDialogState extends State<MypageEditDialog> {
  bool isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: ShadDialog(
        title: const Text('프로필 편집'),
        description: const Text(
          "편집이 완료되면 저장을 눌러주세요.",
        ),
        actions: [
          ShadButton.ghost(
            onPressed: () => RouterService.to.goRouter.pop(),
            foregroundColor: Colors.grey,
            child: Text('취소'),
          ),
          ShadButton(
            icon: isUploading
                ? SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
            onPressed: () async {
              setState(() {
                isUploading = true;
              });
              await MypageController.to.updateProfile();
              setState(() {
                isUploading = false;
              });
            },
            child: Text('저장'),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MypageProfile(
                isEditable: true,
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    child: Text(
                      "이름",
                      textAlign: TextAlign.end,
                      style: context.getTextTheme.small,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ShadInput(
                      initialValue: "김민준",
                      onChanged: (value) {
                        MypageController.to.nickname = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    child: Text(
                      "자기소개",
                      textAlign: TextAlign.end,
                      style: context.getTextTheme.small,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ShadInput(
                      initialValue: "자기소개를 입력해주세요",
                      onChanged: (value) {
                        MypageController.to.description = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
