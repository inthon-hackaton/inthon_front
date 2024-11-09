import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/upload_sheet.dart';
import 'package:inthon_front/app/feature/detail/user_card.dart';
import 'package:inthon_front/app/feature/home/widget/home_appbar.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // List<File?> images = [null, null, null, null];
  final DetailController controller = Get.put(DetailController());
  @override
  void initState() {
    super.initState();
    Get.put(DetailController());
  }

  @override
  void dispose() {
    Get.delete<DetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                          fit: BoxFit.cover,
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        children: List.generate(4, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: ShadButton.outline(
                                width: 100,
                                child: const Text('업로드'),
                                onPressed: () => showShadSheet(
                                  side: ShadSheetSide.bottom,
                                  context: context,
                                  builder: (context) => UploadSheet(
                                    side: "bottom",
                                    index: index,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  UserCard(
                    index: 1,
                    userId: "userId",
                    userProfile:
                        "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShadButton(
                child: const Text('작품 저장하기'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
