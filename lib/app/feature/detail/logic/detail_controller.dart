import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();
  DetailController({required this.draft});

  final Draft draft;

  final _imageList =
      <(XFile?, String pieceUrl, String profile, String name, int pieceId)>[
    (null, "", "", "", 0),
    (null, "", "", "", 0),
    (null, "", "", "", 0),
    (null, "", "", "", 0),
  ].obs;
  List<(XFile?, String pieceUrl, String profile, String name, int pieceId)>
      get imageList => _imageList;
  set imageList(
          List<
                  (
                    XFile?,
                    String pieceUrl,
                    String profile,
                    String name,
                    int pieceId
                  )>
              value) =>
      _imageList.value = value;

  final _pieces = <String>[].obs;
  List<String> get pieces => _pieces;
  set pieces(List<String> value) => _pieces.value = value;

  Future<XFile?> pickImage() async {
    final permission = await _checkPermission(Permission.photos, 'Photos');
    if (!permission) return null;
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return null;
    return result;
  }

  Future<bool> _checkPermission(Permission permission, String label) async {
    final status = await permission.status;
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.denied:
        final result = await permission.request();
        if (result.isGranted) return true;
        openAppSettings();
        SimpleNotify().show("Permission needed to this function work.");
        return false;
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
        return false;
      default:
        return false;
    }
  }

  void selectMyImage(int index, XFile? image) {
    // final me = UserService.to.user;
    // if (me == null) return;
    // imageList[index] = (image, me.picture_url, me.nickname, 0);
    imageList[index] = (
      image,
      "",
      "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
      "me!",
      0
    );
  }

  void selectOtherImage(
      int index, String pieceUrl, String profile, String name, int pieceId) {
    imageList[index] = (null, pieceUrl, profile, name, pieceId);
  }

  void unselectImage(
    int index,
  ) {
    imageList[index] = (null, "", "", "", 0);
  }

  void saveCompletion() async {
    for (var i = 0; i < imageList.length; i++) {
      if (imageList[i].$1 != null) {
        imageList[i] = (
          imageList[i].$1,
          imageList[i].$2,
          imageList[i].$3,
          imageList[i].$4,
          await ServerApiService.to.createPiece(
            i + 1,
            "",
            draft.draft_id,
            imageList[i].$1!,
          ),
        );
      }
    }
    await ServerApiService.to.createCompletion(
      imageList.map((e) => e.$5).toList(),
    );

    RouterService.to.showSimpleToast("작품이 저장되었습니다.");
  }
}
