import 'dart:developer';

import 'package:get/get.dart';
import 'package:inthon_front/app/data/api/dio_api.dart';
import 'package:inthon_front/app/data/extension/dio_response_x.dart';

class ServerApiService extends GetxService {
  static ServerApiService get to => Get.find();
  Future<ServerApiService> init() async {
    return this;
  }

  final api = DioApi();

  Future<({String? accessToken, String? refreshToken})?> googleLogin(
    String openIdToken,
  ) async {
    log({"oi_token": openIdToken}.toString());
    final res = await api.post('/auth/verify_token', data: {
      "oi_token": openIdToken,
    });
    // log(res.data.toString());
    // log(res.statusCode.toString());
    // if (res.isOk) {
    //   return (
    //     accessToken: res.data["access"] as String?,
    //     refreshToken: res.data["refresh"] as String?,
    //   );
    // }
    return null;
  }
}
