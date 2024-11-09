// import 'package:dio/dio.dart';
// import 'package:inthon/app/data/service/auth_service.dart';
// import 'package:inthon/app/data/service/storage_service.dart';

// class AuthInterceptorWrapper extends InterceptorsWrapper {
//   final StorageService storage;
//   final AuthService auth;
//   final Dio dio;

//   AuthInterceptorWrapper(
//       {required this.storage, required this.auth, required this.dio});
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (auth.isLoggedIn) {
//       options.headers["Authorization"] = "Bearer ${auth.accessToken}";
//       return super.onRequest(options, handler);
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode != 401) {
//       return super.onError(err, handler);
//     }

//     try {
//       await auth.refreshAccessToken();

//       err.requestOptions.headers["Authorization"] =
//           "Bearer ${auth.accessToken}";

//       final res = await dio.fetch(err.requestOptions);

//       return handler.resolve(res);
//     } catch (error) {
//       if (_isTokenError(error)) {
//         await auth.handleTokenExpiration();
//       }
//       if (error is DioException) {
//         handler.reject(error);
//       }
//     }
//   }

//   bool _isTokenError(Object error) {
//     if (error is DioException) {
//       return error.response?.statusCode == 401;
//     }

//     return false;
//   }
// }
