import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inthon_front/app/data/model/auth_result.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';

class AuthService extends GetxService {
  static AuthService get to => AuthService();

  final isLoggedInObs = false.obs;
  bool get isLoggedIn => isLoggedInObs.value;
  set isLoggedIn(bool value) => isLoggedInObs.value = value;
  bool get isNotLoggedIn => !isLoggedIn;

  final GoogleSignIn? googleOAuth = GoogleSignIn(
    serverClientId:
        "1067111695591-isu83qg3jtf69qlvabqj8ktafd3ngdje.apps.googleusercontent.com",
  );

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

  Future<AuthResult> loginWithGoogle() async {
    try {
      GoogleSignInAccount? account = await googleOAuth?.signIn();

      if (account == null) {
        SimpleNotify().show("Failed to login with Google");

        return AuthResult.googleFail();
      }
      final idToken = await account.authentication.then((_) async => _.idToken);

      if (idToken == null) {
        SimpleNotify().show("구글 로그인에 실패했습니다.");
        return AuthResult.googleFail();
      }

      return serverOauthLogIn(idToken);
    } catch (e) {
      log('Google login failed: $e');

      return AuthResult.googleFail();
    }
  }

  Future<AuthResult> serverOauthLogIn(
    String idToken,
  ) async {
    final tokens = await ServerApiService.to.googleLogin(idToken);
    if (tokens == null) {
      return AuthResult.serverFail();
    }
    isLoggedIn = true;
    await saveTokens(tokens);
    // final result = await UserService.to.getMe();
    if (true) return AuthResult.success();

    return AuthResult.serverFail();
  }

  Future<void> saveTokens(
    ({String? accessToken, String? refreshToken}) tokens,
  ) async {
    assert(tokens.accessToken != null && tokens.refreshToken != null);
    await storage.token.saveTokens(
      accessToken: tokens.accessToken!,
      refreshToken: tokens.refreshToken!,
    );
    accessToken = tokens.accessToken;
    refreshToken = tokens.refreshToken;
  }
}
