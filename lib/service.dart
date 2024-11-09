import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';
import 'package:inthon_front/app/data/service/user_service.dart';
import 'package:inthon_front/firebase_options.dart';

class Service {
  static Future<void> initFlutter() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  static initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> initGetx() async {
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => RouterService().init());
    await Get.putAsync(() => AuthService().init());
    await Get.putAsync(() => ServerApiService().init());
    await Get.putAsync(() => UserService().init());
  }
}
