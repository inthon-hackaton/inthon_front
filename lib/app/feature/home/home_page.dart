import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/home/list_card.dart';

import 'package:inthon_front/app/feature/home/logic/home_controller.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/gallery_tab.dart';
import 'package:inthon_front/app/feature/home/tabs/home/home_tab.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/mypage_tab.dart';
import 'package:inthon_front/app/feature/home/widget/home_appbar.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: HomeAppbar(),
      body: SafeArea(
        child: PersistentTabView(
          onTabChanged: (value) {
            HomeController.to.homeIndex = value;
          },
          navBarBuilder: (navBarConfig) => Style10BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
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

//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 ListCard(
//                   imageUrl:
//                       "https://cdn-icons-png.freepik.com/256/5074/5074433.png?ga=GA1.1.2040043038.1719550100&semt=sph",
//                   userImage1:
//                       "	https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
//                   userImage2:
//                       "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
//                   userImage3:
//                       "https://cdn-icons-png.freepik.com/256/9821/9821474.png?ga=GA1.1.2040043038.1719550100&semt=ais_hybrid",
//                   name: "nameeeeeeeee",
//                   people: 3,
//                 ),
//               ],
//             ),
//           ),
//         ],
      ),
    );
  }
}
