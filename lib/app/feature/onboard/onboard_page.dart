import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/onboard/logic/onboard_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Get.put(OnboardController());
  }

  @override
  void dispose() {
    Get.delete<OnboardController>();
    super.dispose();
  }

  void onTap() async {
    // if (isLoading) {
    //   return;
    // }
    setState(() {
      isLoading = true;
    });

    await OnboardController.to.loginGoogle();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    width: 80,
                    height: 80,
                    "assets/icon.png",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '나뭇잎',
                    style: context.getTextTheme.h2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '조각 그림 심리치료 프로젝트',
                    style: context.getTextTheme.muted,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 17,
              left: 17,
              right: 17,
              child: GestureDetector(
                onTap: onTap,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 55,
                      child: ShadButton(
                        onPressed: onTap,
                        icon: Image(
                          width: 20,
                          height: 20,
                          image: const AssetImage(
                            'assets/google_logo.png',
                          ),
                        ),
                        child: const Text('Google Login으로 계속하기'),
                      ),
                    ),
                    if (isLoading)
                      Positioned(
                        top: 10,
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          color: context.theme.primaryColor,
                          child: Center(
                            child: LoadingAnimationWidget.waveDots(
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
