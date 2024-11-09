import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    if (isLoading) {
      return;
    }
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
            Center(child: Text('Onboard')),
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
