import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();

  bool isLoading = false;

  // List<File?> images = [null, null, null, null];
  // List<String> imageList = [];
  var imageList = <String>[].obs;

  Future<void> onTapCard() async {
    RouterService.to.goRouter.go('/detail');
  }

  final _pickedImage = Rxn<XFile?>();
  XFile? get pickedImage => _pickedImage.value;
  set pickedImage(XFile? value) => _pickedImage.value = value;

  void onTapUpload() async {
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

  void saveImage(BuildContext context, int index, String userId) {
    print("save");
    imageList.insert(index, userId);
    print(imageList);
    Navigator.pop(context);
  }

  void deleteImage(BuildContext context, int index) {
    print("delete");
    if (index >= 0 && index < imageList.length) {
      // imageList[index] = ""; // 해당 인덱스의 요소를 빈 문자열로 변경
      imageList.removeAt(index);
    }
    print(imageList);
  }
}
