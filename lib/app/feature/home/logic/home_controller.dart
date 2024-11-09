import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/data/service/server_api_service.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late final PagingController<int, Draft> draftPagingController;

  HomeController() {
    draftPagingController = PagingController(firstPageKey: 0)
      ..addPageRequestListener(
        (pageKey) => _fetchDrafts(pageKey),
      );
  }

  final _homeIndex = 0.obs;
  int get homeIndex => _homeIndex.value;
  set homeIndex(int value) => _homeIndex.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final _drafts = <Draft>[].obs;
  List<Draft> get drafts => _drafts;
  set drafts(List<Draft> value) => _drafts.value = value;

  static const _pageSize = 8;

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

  Future<void> _fetchDrafts(int pageKey) async {
    final newStreamers = await ServerApiService.to.getDrafts(
      offset: pageKey,
      limit: _pageSize,
    );
    final isLastPage = newStreamers.length < _pageSize;
    if (isLastPage) {
      draftPagingController.appendLastPage(newStreamers);
      return;
    }
    final nextPageKey = pageKey + newStreamers.length;
    draftPagingController.appendPage(newStreamers, nextPageKey);
  }
}
