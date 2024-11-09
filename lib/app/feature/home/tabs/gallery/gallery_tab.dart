import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = false;

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
              child: FadeInAnimation(child: GalleryItem()),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
