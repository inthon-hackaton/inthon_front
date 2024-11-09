import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/home/logic/home_controller.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.eco, color: context.getColorScheme.primary),
          SizedBox(width: 10),
          Obx(() {
            return Text(
              HomeController.to.title,
              style: context.getTextTheme.h4,
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
