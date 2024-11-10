import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find<StorageService>();
  Future<StorageService> init() async {
    final storage = await SharedPreferences.getInstance();
    token = TokenStorage(storage);
    // cache = CacheStorage(storage);

    return this;
  }

  // late final CacheStorage cache;
  late final TokenStorage token;
}
