import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      await Service.initFlutter();
      await Service.initFirebase();
      await Service.initGetx();

      final goRouter = RouterService.to.goRouter;

      runApp(
        ShadApp.router(
          title: "Leaf",
          debugShowCheckedModeBanner: false,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
          routerDelegate: goRouter.routerDelegate,
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: ShadColorScheme.fromName('green'),
          ),
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) => child!),
              ],
            );
          },
        ),
      );
    },
    (error, stackTrace) {
      debugPrint('runZonedGuarded: $stackTrace');
      log('runZonedGuarded: ', error: error, stackTrace: stackTrace);
      debugPrint('runZonedGuarded: $error');
    },
  );
}
