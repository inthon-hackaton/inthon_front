import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/upload_sheet.dart';
import 'package:inthon_front/app/feature/detail/user_card.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('사진 설명입니다', style: context.getTextTheme.h4),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
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
                            return GestureDetector(
                              onTap: () {
                                showShadSheet(
                                  side: ShadSheetSide.bottom,
                                  context: context,
                                  builder: (context) => UploadSheet(
                                    index: index,
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    for (int i = 0; i < 4; i++) UserCard(index: i),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return ShadButton(
                    onPressed: () {},
                    enabled: controller.isValid,
                    child: Text('작품 저장하기'),
                  );
                }),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
