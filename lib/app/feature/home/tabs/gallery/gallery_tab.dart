import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/logic/gallery_controller.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';
import 'package:lottie/lottie.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  @override
  void initState() {
    super.initState();
    Get.put(GalleryController()..getCompletions());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = GalleryController.to.isLoading;
      if (isLoading) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) => GalleryItem.loading(),
            separatorBuilder: (c, i) => SizedBox(height: 15),
            itemCount: 3,
          ),
        );
      }

      final completions = GalleryController.to.completions;
      if (completions.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: LottieBuilder.asset(
                "assets/empty_cat.json",
              ),
            ),
            SizedBox(height: 17),
            Text(
              '아직 등록된 완료작품이 없어요..',
              style: context.getTextTheme.small,
            ),
          ],
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: AnimationLimiter(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 90),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                delay: Duration(milliseconds: index * 200),
                child: FadeInAnimation(
                  child: GalleryItem(
                    completion: completions[index],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: completions.length,
          ),
        ),
      );
    });
  }
}
