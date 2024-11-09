import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/widget/mypage_profile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MypageEditDialog extends StatelessWidget {
  const MypageEditDialog({Key? key}) : super(key: key);

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
            onPressed: () {},
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
                    child: ShadInput(initialValue: "김민준"),
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
                    child: ShadInput(initialValue: "자기소개를 입력해주세요"),
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
