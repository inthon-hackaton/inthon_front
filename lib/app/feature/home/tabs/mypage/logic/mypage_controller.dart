import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/model/user_stat.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';
import 'package:inthon_front/app/data/service/user_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';
import 'package:permission_handler/permission_handler.dart';

class MypageController extends GetxController {
  static MypageController get to => Get.find();

  bool isLoading = false;

  final _pickedImage = Rxn<XFile?>();
  XFile? get pickedImage => _pickedImage.value;
  set pickedImage(XFile? value) => _pickedImage.value = value;

  final _stats = Rxn<UserStat>();
  UserStat? get stats => _stats.value;
  set stats(UserStat? value) => _stats.value = value;

  String nickname = "";
  String description = "";

  void getStats() async {
    stats = await ServerApiService.to.getUserStats();
  }

  void onTapProfile() async {
    if (isLoading) return;
    isLoading = true;
    await pickImage();
    isLoading = false;
  }

  Future<void> pickImage() async {
    final permission = await _checkPermission(Permission.photos, 'Photos');
    if (!permission) return;
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    pickedImage = result;
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

  Future<void> updateProfile() async {
    await UserService.to.updateUser(
      newNickname: nickname.isEmpty ? null : nickname,
      newDescription: description.isEmpty ? null : description,
      newProfileImage: pickedImage,
    );
  }
}
