import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inthon_front/app/data/model/auth_result.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';
import 'package:inthon_front/app/data/service/user_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();

  final isLoggedInObs = false.obs;
  bool get isLoggedIn => isLoggedInObs.value;
  set isLoggedIn(bool value) => isLoggedInObs.value = value;
  bool get isNotLoggedIn => !isLoggedIn;

  final GoogleSignIn? googleOAuth = GoogleSignIn(
    serverClientId:
        "1067111695591-isu83qg3jtf69qlvabqj8ktafd3ngdje.apps.googleusercontent.com",
  );

  String? accessToken;
  StorageService? storage;

  Future<AuthService> init() async {
    storage = StorageService.to;
    await _checkLoggedIn();
    return this;
  }

  Future<void> _checkLoggedIn() async {
    final tokens = await storage?.token.getTokens();
    log(tokens.toString());

    if (tokens != null) {
      isLoggedIn = true;
      accessToken = tokens.accessToken;
      log('AccessToken: $accessToken');
    }
  }

  Future<void> logout() async {
    await storage?.token.deleteTokens();
    isLoggedIn = false;
    if (Get.isRegistered<UserService>()) {
      UserService.to.user = null;
    }
  }

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
      log("OID TOKEN:$idToken");

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
    log("token::$tokens");
    isLoggedIn = true;
    await saveTokens(tokens);
    final result = await UserService.to.getMe();
    if (result) return AuthResult.success();

    return AuthResult.serverFail();
  }

  Future<void> saveTokens(
    String? accessToken,
  ) async {
    assert(accessToken != null);
    log('Saving tokens: $accessToken');
    await storage?.token.saveTokens(
      accessToken: accessToken!,
    );
    this.accessToken = accessToken;
    log("Current token: $accessToken");
  }

  Future<void> handleTokenExpiration() async {
    RouterService.to.showSimpleToast("세션이 만료되었습니다. 다시 로그인해주세요.");
    await logout();
  }
}
