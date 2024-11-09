import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/home/logic/home_controller.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/gallery_tab.dart';
import 'package:inthon_front/app/feature/home/tabs/home/home_tab.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/mypage_tab.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:sprung/sprung.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          navBarBuilder: (navBarConfig) => Style10BottomNavBar(
            navBarConfig: navBarConfig,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            curve: Sprung.overDamped,
          ),
          tabs: [
            PersistentTabConfig(
              screen: HomeTab(),
              item: ItemConfig(
                icon: Icon(Icons.home),
                title: "홈",
                activeForegroundColor: context.getColorScheme.primary,
              ),
            ),
            PersistentTabConfig(
              screen: GalleryTab(),
              item: ItemConfig(
                icon: Icon(Icons.image),
                title: "내 작품",
                activeForegroundColor: context.getColorScheme.primary,
              ),
            ),
            PersistentTabConfig(
              screen: MypageTab(),
              item: ItemConfig(
                icon: Icon(Icons.person),
                title: "마이페이지",
                activeForegroundColor: context.getColorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
