import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/go_router_x.dart';
import 'package:inthon_front/app/feature/error/error_page.dart';
import 'package:inthon_front/app/feature/home/home_page.dart';
import 'package:inthon_front/app/feature/onboard/onboard_page.dart';

class RouterService extends GetxService {
  static RouterService get to => Get.find();

  String? queryParameter(String key) =>
      goRouter.currentUri.queryParameters[key];

  Future<T?> openDialog<T>({
    required Widget Function(BuildContext context) builder,
  }) async {
    final context = goRouter.context;
    if (context != null) {
      return showDialog<T>(context: context, builder: builder);
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
        final isOnboard = path.startsWith("/onboard");
        if (!isOnboard) {
          // if (AuthService.to.isLoggedIn) {
          // return null;
          // }
          return "/onboard";
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/onboard',
          builder: (context, state) => const OnboardPage(),
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
