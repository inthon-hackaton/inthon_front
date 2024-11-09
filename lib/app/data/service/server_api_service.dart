import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/api/dio_api.dart';
import 'package:inthon_front/app/data/extension/dio_response_x.dart';
import 'package:inthon_front/app/data/model/completion.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/model/user.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image/image.dart' as img;

class ServerApiService extends GetxService {
  static ServerApiService get to => Get.find();
  Future<ServerApiService> init() async {
    return this;
  }

  final api = DioApi();

  Future<({String? accessToken, String? refreshToken})?> googleLogin(
    String openIdToken,
  ) async {
    log({"oi_token": openIdToken}.toString());
    final res = await api.post('/auth/verify_token', data: {
      "oi_token": openIdToken,
    });
    // log(res.data.toString());
    // log(res.statusCode.toString());
    if (res.isOk) {
      return (
        accessToken: res.data["access"] as String?,
        refreshToken: res.data["refresh"] as String?,
      );
    }
    return null;
  }

  Future<User?> getMe() async {
    final res = await api.get('/user/get-info');
    if (res.isOk) {
      return User.fromJson(res.data);
    }
    return null;
  }

  Future<List<Completion>> getCompletions() async {
    final res = await api.get('/completion/user-list');
    if (res.isOk) {
      return (res.data as List)
          .map((e) => Completion.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Future<List<Completion>> getCompletions() async {
  //   final res = await api.get('/completion/user-list');
  //   if (res.isOk) {
  //     return (res.data as List)
  //         .map((e) => Completion.fromJson(e as Map<String, dynamic>))
  //         .toList();
  //   }
  //   return [];
  // }

  Future<List<Draft>> getDrafts({
    required int offset,
    required int limit,
  }) async {
    final res = await api.get(
      '/draft/draft-list?offset=$offset&limit=$limit',
    );
    if (res.isOk) {
      return (res.data as List)
          .map((e) => Draft.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<User> updateUser({
    String? newNickname,
    String? description,
    XFile? newProfileImage,
  }) async {
    Map<String, dynamic> data = {};
    if (newNickname != null) {
      data["nickname"] = newNickname;
    }
    if (description != null) {
      data["description"] = description;
    }
    if (newProfileImage != null) {
      data["profile_picture"] = await cropImageAndConvertMultipart(
        newProfileImage,
      );
    }
    final res = await api.post(
      "/user/modify-info",
      data: dio.FormData.fromMap(data),
    );
    return User.fromJson(res.data);
  }

  Future<dio.MultipartFile> cropImageAndConvertMultipart(XFile image) async {
    final imgObj = img.decodeImage(await image.readAsBytes());

    final cropped = img.copyResize(
      imgObj!,
      width: 512,
      height: 512,
      maintainAspect: true,
    );

    return dio.MultipartFile.fromBytes(
      img.encodeNamedImage(image.name, cropped)!,
      filename: image.name,
    );
  }
}
