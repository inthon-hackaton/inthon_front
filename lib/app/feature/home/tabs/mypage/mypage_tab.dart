// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/logic/mypage_controller.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/widget/mypage_edit_dialog.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/widget/mypage_profile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MypageTab extends StatefulWidget {
  const MypageTab({Key? key}) : super(key: key);

  @override
  _MypageTabState createState() => _MypageTabState();
}

class _MypageTabState extends State<MypageTab> {
  @override
  void initState() {
    super.initState();
    Get.put(MypageController());
  }

  @override
  void dispose() {
    Get.delete<MypageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.getTextTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MypageProfile(isEditable: false),
          SizedBox(height: 15),
          Text("김민준", style: textTheme.h3),
          SizedBox(height: 5),
          Text("자기소개를 입력해주세요.", style: textTheme.p),
          SizedBox(height: 15),
          ShadButton.ghost(
            onPressed: () {
              RouterService.to.openDialog(
                builder: (context) {
                  return MypageEditDialog();
                },
              );
            },
            icon: Icon(Icons.edit, size: 20),
            child: const Text('프로필 편집'),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ShadCard(
                    radius: BorderRadius.circular(40),
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: context.getColorScheme.primary,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "32",
                    style: textTheme.h4.copyWith(color: Colors.green),
                  ),
                  Text("게시물", style: textTheme.muted),
                ],
              ),
              Column(
                children: [
                  ShadCard(
                    radius: BorderRadius.circular(40),
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "392",
                    style: textTheme.h4.copyWith(color: Colors.pink),
                  ),
                  Text("좋아요", style: textTheme.muted),
                ],
              ),
              Column(
                children: [
                  ShadCard(
                    radius: BorderRadius.circular(40),
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Icon(
                        Icons.share_rounded,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "332",
                    style: textTheme.h4.copyWith(color: Colors.blue),
                  ),
                  Text("인용횟수", style: textTheme.muted),
                ],
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: double.maxFinite,
            child: ShadButton.ghost(
              onPressed: () => context.push("/license"),
              icon: Icon(Icons.article_outlined, size: 20),
              child: const Text('라이선스'),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ShadButton.ghost(
              onPressed: () async {
                await AuthService.to.logout();
                context.go("/onboard");
              },
              foregroundColor: Colors.red,
              icon: Icon(Icons.logout_outlined, size: 20),
              child: SizedBox(
                child: const Text('로그아웃'),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
