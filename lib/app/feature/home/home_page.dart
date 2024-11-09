import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/feature/home/list_card.dart';
import 'package:inthon_front/app/feature/home/logic/home_controller.dart';

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
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                ListCard(
                  imageUrl:
                      "https://cdn-icons-png.freepik.com/256/5074/5074433.png?ga=GA1.1.2040043038.1719550100&semt=sph",
                  userImage1:
                      "	https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  userImage2:
                      "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  userImage3:
                      "https://cdn-icons-png.freepik.com/256/9821/9821474.png?ga=GA1.1.2040043038.1719550100&semt=ais_hybrid",
                  name: "nameeeeeeeee",
                  people: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
