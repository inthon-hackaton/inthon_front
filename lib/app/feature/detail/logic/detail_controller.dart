import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'dart:io';

class DetailController extends GetxController {
  static DetailController get to => Get.find();
  List<File?> images = [null, null, null, null];
  Future<void> onTapCard() async {
    RouterService.to.goRouter.go('/detail');
  }

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images[index] = File(pickedFile.path); // 선택한 이미지를 해당 영역에 저장
      update(); // 상태 업데이트
    }
  }
}
