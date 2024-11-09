import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/go_router_x.dart';
import 'package:inthon_front/app/feature/error/error_page.dart';
import 'package:inthon_front/app/feature/home/home_page.dart';
import 'package:inthon_front/app/feature/onboard/onboard_page.dart';
import 'package:inthon_front/app/feature/photo_view/photo_view_page.dart';
import 'package:inthon_front/app/feature/tutorial/tutorial_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RouterService extends GetxService {
  static RouterService get to => Get.find();

  String? queryParameter(String key) =>
      goRouter.currentUri.queryParameters[key];

  Future<T?> openDialog<T>({
    required Widget Function(BuildContext context) builder,
  }) async {
    final context = goRouter.context;
    if (context != null) {
      return showShadDialog(
        context: context,
        builder: (context) => builder(context),
      );
    }
    return null;
  }

  Future<T?> openBottomSheet<T>({
    required Widget Function(BuildContext) builder,
  }) async {
    final context = goRouter.context;
    if (context != null) {
      return showModalBottomSheet<T>(
        context: context,
        builder: builder,
        backgroundColor: Colors.white,
      );
    }
    return null;
  }

  Future<RouterService> init() async {
    goRouter = GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        final path = state.uri.toString();
        // final isOnboard = path.startsWith("/onboard");
        // if (!isOnboard) {
        //   // if (AuthService.to.isLoggedIn) {
        //   // return null;
        //   // }
        //   return "/onboard";
        // }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: "photo_view",
              builder: (context, state) {
                return PhotoViewPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/license',
          builder: (context, state) => const LicensePage(),
        ),
        GoRoute(
          path: '/onboard',
          builder: (context, state) => const OnboardPage(),
          routes: [
            GoRoute(
              path: 'tutorial',
              builder: (context, state) => const TutorialPage(),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
    );
    return this;
  }

  late final GoRouter goRouter;
}
