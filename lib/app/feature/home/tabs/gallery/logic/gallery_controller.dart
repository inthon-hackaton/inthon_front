import 'package:get/get.dart';
import 'package:inthon_front/app/data/model/completion.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';

class GalleryController extends GetxController {
  static GalleryController get to => Get.find();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final _completions = <Completion>[].obs;
  List<Completion> get completions => _completions.toList();
  set completions(List<Completion> value) => _completions.value = value;

  void getCompletions() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    completions = await ServerApiService.to.getCompletions();
    isLoading = false;
  }
}
