import 'package:dio/dio.dart';

extension DioResponseX on Response {
  bool get isOk =>
      statusCode == null ? false : statusCode! >= 200 && statusCode! <= 299;
}
