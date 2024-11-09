import 'package:get/get.dart';
import 'package:inthon_front/app/data/api/dio_api.dart';

class ServerApiService extends GetxService {
  static ServerApiService get to => Get.find();
  Future<ServerApiService> init() async {
    return this;
  }

  final api = DioApi();
}
