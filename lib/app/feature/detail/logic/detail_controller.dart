import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/widget/overlay/simple_notify.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();

  final _imageList = <String>["", "", "", ""].obs;
  List<String> get imageList => _imageList;
  set imageList(List<String> value) => _imageList.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final _pickedImage = Rxn<XFile?>();
  XFile? get pickedImage => _pickedImage.value;
  set pickedImage(XFile? value) => _pickedImage.value = value;

  bool get isValid => imageList.every((element) => element.isNotEmpty);

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

  void saveImage(int index, String userId) {
    imageList[index] = userId;
  }

  void deleteImage(int index) {
    imageList[index] = "";
  }
}
