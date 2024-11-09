import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';

class Service {
  static Future<void> initFlutter() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  // 순서관계
  // StorageService > AuthService
  // StorageService > AuthService > ServerApiService
  // StorageService > AuthService > UserService

  // RouterSerivce > ChatService
  static Future<void> initGetx() async {
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => RouterService().init());
    await Get.putAsync(() => ServerApiService().init());
  }
}
