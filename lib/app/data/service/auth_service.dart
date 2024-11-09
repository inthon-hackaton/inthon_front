import 'dart:developer';

import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';

class AuthService extends GetxService {
  static AuthService get to => AuthService();

  final isLoggedInObs = false.obs;
  bool get isLoggedIn => isLoggedInObs.value;
  set isLoggedIn(bool value) => isLoggedInObs.value = value;
  bool get isNotLoggedIn => !isLoggedIn;

  String? accessToken;
  String? refreshToken;

  late final StorageService storage;
  Future<AuthService> init() async {
    storage = StorageService.to;
    await _checkLoggedIn();
    return this;
  }

  Future<void> _checkLoggedIn() async {
    final tokens = await storage.token.getTokens();

    if (tokens != null) {
      isLoggedIn = true;
      accessToken = tokens.accessToken;
      refreshToken = tokens.refreshToken;
      log('AccessToken: $accessToken');
      log('RefreshToken: $refreshToken');
    }
  }

  Future<void> logout() async {}
}
