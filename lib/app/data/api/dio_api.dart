import 'dart:async';

import 'package:dio/dio.dart';
import 'package:inthon_front/app/data/api/error_interceptor_wrapper.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';

class DioApi {
  DioApi() : _dio = Dio() {
    _dio.interceptors.addAll([
      ErrorInterceptorWrapper(
        notifier: SimpleNotify(),
      ),
    ]);
  }

  final Dio _dio;
  static const _host = "https://api.vreeze.app/api/v1";

  Future<Response> get(
    String path, {
    CancelToken? cancelToken,
  }) async {
    return _dio.get(_host + path, cancelToken: cancelToken);
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
