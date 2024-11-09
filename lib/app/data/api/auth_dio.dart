import 'package:dio/dio.dart';

class AuthDio {
  final dio = Dio();
  static const _host = "http://15.165.76.65:8000/api/v1";

  Future<({String accessToken, String refreshToken})?> refreshToken(
    String? refreshToken,
  ) async {
    final res = await dio.post(
      "$_host/token/refresh",
      data: {
        "refresh": refreshToken,
      },
    );
    final statusCode = res.statusCode;
    if (statusCode == null ? false : statusCode >= 200 && statusCode <= 299) {
      return (
        accessToken: res.data["access"] as String,
        refreshToken: res.data["refresh"] as String,
      );
    }
    return null;
  }
}
