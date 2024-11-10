import 'package:dio/dio.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';

class AuthInterceptorWrapper extends InterceptorsWrapper {
  final StorageService storage;

  final Dio dio;

  AuthInterceptorWrapper({required this.storage, required this.dio});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (AuthService.to.isLoggedIn) {
      options.headers["Authorization"] = "Bearer ${AuthService.to.accessToken}";

      return super.onRequest(options, handler);
    }
    super.onRequest(options, handler);
  }
}
