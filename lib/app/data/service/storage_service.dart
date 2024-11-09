// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/service/storage/token_storage.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  Future<StorageService> init() async {
    const storage = FlutterSecureStorage();
    token = TokenStorage(storage);
    // cache = CacheStorage(storage);

    return this;
  }

  // late final CacheStorage cache;
  late final TokenStorage token;
}
