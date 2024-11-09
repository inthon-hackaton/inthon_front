import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';

class ErrorInterceptorWrapper extends InterceptorsWrapper {
  final SimpleNotify notifier;

  ErrorInterceptorWrapper({
    required this.notifier,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    if (statusCode == 401 || statusCode == 403 || statusCode == 400) {
      try {
        notifier.show(err.response!.data['error']);
        log(err.response!.data['error']);
        log(err.requestOptions.path.toString());
        handler.resolve(err.response!);
        return;
      } catch (e) {
        log(e.toString());
      }
    }

    super.onError(err, handler);
  }
}
