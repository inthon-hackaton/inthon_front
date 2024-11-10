import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/api/dio_api.dart';
import 'package:inthon_front/app/data/extension/dio_response_x.dart';
import 'package:inthon_front/app/data/model/completion.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/model/piece.dart';
import 'package:inthon_front/app/data/model/user.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image/image.dart' as img;
import 'package:inthon_front/app/data/model/user_stat.dart';

class ServerApiService extends GetxService {
  static ServerApiService get to => Get.find();
  Future<ServerApiService> init() async {
    return this;
  }

  final api = DioApi();

  Future<String?> googleLogin(
    String openIdToken,
  ) async {
    log({"oi_token": openIdToken}.toString());
    final res = await api.post('/auth/verify_token', data: {
      "oi_token": openIdToken,
    });

    log("data::${res.data}");
    // log(res.statusCode.toString());
    if (res.isOk) {
      return res.data["access_token"] as String?;
    }
    return null;
  }

  Future<User?> getMe() async {
    final res = await api.get('/user/get-info', isAuth: true);
    if (res.isOk) {
      return User.fromJson(res.data);
    }
    return null;
  }

  Future<List<Piece>> getPieces(int draftId) async {
    final res = await api.get('/draft/draft-piece-list?draft_id=$draftId');
    if (res.isOk) {
      return (res.data as List)
          .map((e) => Piece.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
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

  Future<UserStat?> getUserStats() async {
    final res = await api.get('/piece/user-stats');
    if (res.isOk) {
      return UserStat.fromJson(res.data);
    }
    return null;
  }

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
    log(data.toString());
    final res = await api.post(
      "/user/update-info",
      data: dio.FormData.fromMap(data),
    );
    return User.fromJson(res.data);
  }

  Future<int> createPiece(
    int pieceNumber,
    String description,
    int draftId,
    XFile image,
  ) async {
    final res = await api.post(
      "/piece/create?draft_id=$draftId&piece_number=$pieceNumber&description=$description",
      data: dio.FormData.fromMap({
        "picture": await cropImageAndConvertMultipart(
          image,
        ),
      }),
    );
    if (res.isOk) {
      return res.data["piece_id"] as int;
    }
    return -1;
  }

  Future<Completion?> createCompletion(List<int> pieceIds) async {
    log({
      "piece_ids": pieceIds,
    }.toString());
    final res = await api.post(
      "/completion/create",
      data: {
        "piece_ids": pieceIds,
      },
    );
    if (res.isOk) {
      return Completion.fromJson(res.data);
    }
    return null;
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
