import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/extension/datetime_x.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/image_contributers.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({Key? key, this.isLoadingWidget = false}) : super(key: key);
  final bool isLoadingWidget;

  Widget get _image => Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue[100 * (1)],
          ),
          child: Center(
            child: Text(
              'Item',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );

  Widget get _loadingWidget {
    return ShadCard(
      padding: const EdgeInsets.all(17),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100, height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  factory GalleryItem.loading() {
    return GalleryItem(isLoadingWidget: true);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingWidget) return _loadingWidget;
    return GestureDetector(
      onTap: () {
        context.push("/photo_view");
      },
      child: ShadCard(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _image,
                SizedBox(width: 5),
                _image,
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                _image,
                SizedBox(width: 5),
                _image,
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.image, size: 20, color: Colors.green),
                          SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              "그림의 주제",
                              style: context.getTextTheme.large,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16, color: Colors.grey),
                          SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              DateTime.now().simpleDateFormat,
                              style: context.getTextTheme.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ImageContributers(
                  contributers: ["민준", "준희", "의찬", "다영"],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
