import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/router_service.dart';

class OnboardController extends GetxController {
  static OnboardController get to => Get.find();

  Future<void> loginGoogle() async {
    await AuthService.to.loginWithGoogle();

    // RouterService.to.goRouter.go('/onboard/tutorial');
    RouterService.to.goRouter.go('/');
  }
}
