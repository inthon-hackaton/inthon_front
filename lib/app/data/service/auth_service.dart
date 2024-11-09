import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        // "1067111695591-lq5k0u37ftnt0f2u20qf6id5pfqkmg40.apps.googleusercontent.com",
        "1067111695591-isu83qg3jtf69qlvabqj8ktafd3ngdje.apps.googleusercontent.com",
  );
  //web: 1067111695591-isu83qg3jtf69qlvabqj8ktafd3ngdje.apps.googleusercontent.com

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

  Future<void> loginWithGoogle() async {
    try {
      GoogleSignInAccount? account = await googleOAuth?.signIn();

      if (account == null) {
        SimpleNotify().show("Failed to login with Google");

        // return AuthResult.googleFail();
      }
      final aa = await account?.authentication;
      log("Google login success: ${aa}");
      log("Google login success tt: ${aa?.idToken}");
      // final idToken =
      //     await account?.authentication.then((_) async => _.idToken);

      // if (idToken == null) {
      //   SimpleNotify().show("Failed to login with Google");
      //   return AuthResult.googleFail();
      // }

      // return serverOauthLogIn(idToken, email, LoginMethod.google);
    } catch (e) {
      log('Google login failed: $e');
      // log("Google login failed: $e");

      // return AuthResult.googleFail();
    }
  }
}
