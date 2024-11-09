import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/go_router_x.dart';
import 'package:inthon_front/app/feature/detail/detail_page.dart';
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

  CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
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
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: HomePage(),
          ),
          routes: [
            GoRoute(
              path: "photo_view",
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: PhotoViewPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/license',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: LicensePage(),
          ),
        ),
        GoRoute(
          path: '/onboard',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const OnboardPage(),
          ),
          routes: [
            GoRoute(
              path: 'tutorial',
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const TutorialPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/detail',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const DetailPage(),
          ),
        )
      ],
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
    );
    return this;
  }

  late final GoRouter goRouter;
}
