import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/router_service.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final _homeIndex = 0.obs;
  int get homeIndex => _homeIndex.value;
  set homeIndex(int value) => _homeIndex.value = value;
  Future<void> onTapListCard() async {
    RouterService.to.goRouter.go('/detail');
  }

  String get title {
    switch (homeIndex) {
      case 0:
        return "나뭇잎";
      case 1:
        return "내 작품";
      case 2:
        return "마이페이지";
      default:
        return "";
    }
  }
}
