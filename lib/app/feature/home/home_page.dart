import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold();
    // return Scaffold(
    //   appBar: App,
    //   body: SafeArea(child: child),
    // );
  }
}
