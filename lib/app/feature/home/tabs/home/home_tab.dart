import 'package:flutter/material.dart';
import 'package:inthon_front/app/feature/home/list_card.dart';
import 'package:inthon_front/app/feature/home/logic/home_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
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
                      "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  userImage2:
                      "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  userImage3:
                      "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  name: "nameeeeeeeee",
                  people: 3,
                  onTap: HomeController().onTapListCard,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
