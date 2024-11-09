import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inthon_front/app/data/model/user.dart';
import 'package:inthon_front/app/data/service/auth_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _user = Rxn<User>();
  User? get user => _user.value;
  set user(User? value) => _user.value = value;

  Future<UserService> init() async {
    if (AuthService.to.isLoggedIn) {
      await getMe();
    }
    return this;
  }

  Future<bool> getMe() async {
    user = await ServerApiService.to.getMe();

    return user != null;
  }

  Future<void> updateUser({
    String? newNickname,
    String? newDescription,
    XFile? newProfileImage,
  }) async {
    final user = await ServerApiService.to.updateUser(
      newNickname: newNickname,
      newProfileImage: newProfileImage,
    );
    this.user = user;
    return;
  }
}
