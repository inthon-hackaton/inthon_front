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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }

    if (_isTokenError(err)) {
      await AuthService.to.handleTokenExpiration();
    }
    handler.reject(err);
  }

  bool _isTokenError(Object error) {
    if (error is DioException) {
      return error.response?.statusCode == 401;
    }

    return false;
  }
}
