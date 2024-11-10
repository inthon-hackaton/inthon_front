import 'dart:async';

import 'package:dio/dio.dart';
import 'package:inthon_front/app/data/api/auth_interceptor_wrapper.dart';
import 'package:inthon_front/app/data/api/error_interceptor_wrapper.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';

class DioApi {
  DioApi() : _dio = Dio() {
    _dio.interceptors.addAll([
      AuthInterceptorWrapper(
        dio: _dio,
        storage: StorageService.to,
      ),
      ErrorInterceptorWrapper(
        notifier: SimpleNotify(),
      ),
    ]);
  }

  final Dio _dio;
  static const _host = "http://15.165.76.65:8000/api/v1";

  Future<Response> get(
    String path, {
    CancelToken? cancelToken,
    bool isAuth = false,
  }) async {
    return _dio.get(
      _host + path,
      cancelToken: cancelToken,
      options: isAuth
          ? Options(
              headers: {
                "Authorization": "Bearer ${AuthService.to.accessToken}",
              },
            )
          : null,
    );
  }

  Future<Response> post(
    String path, {
    required dynamic data,
    CancelToken? cancelToken,
  }) async {
    return _dio.post(_host + path, data: data, cancelToken: cancelToken);
  }

  Future<Response> delete(
    String path, {
    CancelToken? cancelToken,
  }) async {
    return _dio.delete(_host + path, cancelToken: cancelToken);
  }

  Future<Response> put(
    String path, {
    required dynamic data,
    CancelToken? cancelToken,
  }) async {
    return _dio.put(_host + path, data: data, cancelToken: cancelToken);
  }
}
