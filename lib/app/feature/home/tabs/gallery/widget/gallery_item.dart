import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/extension/datetime_x.dart';
import 'package:inthon_front/app/data/model/completion.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/image_contributers.dart';
import 'package:inthon_front/app/feature/home/tabs/home/home_tab.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    Key? key,
    this.isLoadingWidget = false,
    required this.completion,
  }) : super(key: key);
  final bool isLoadingWidget;
  final Completion completion;

  Widget _image(int index, BuildContext context) => Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              // color: Colors.blue[100 * (1)],
              ),
          child: Center(
            child: Text(
              '아직 등록된\n이미지가 없어요!',
              style: context.getTextTheme.muted,
              textAlign: TextAlign.center,
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
    return GalleryItem(
      isLoadingWidget: true,
      completion: Completion(
        completion_id: 0,
        created_at: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log(completion.toString());
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
                _image(0, context),
                SizedBox(width: 5),
                _image(1, context),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                _image(2, context),
                SizedBox(width: 5),
                _image(3, context),
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
                          Icon(Icons.schedule, size: 16, color: Colors.grey),
                          SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              completion.created_at.simpleDateFormat,
                              style: context.getTextTheme.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ImageContributers(
                  highlightFirst: true,
                  contributers: completion.pieces
                      .map((e) => e.profile_picture_link)
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
