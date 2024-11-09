import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/upload_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UserCard extends StatelessWidget {
  final int index;
  const UserCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final item = DetailController.to.imageList.elementAt(index);

      if (item.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 17),
          child: DottedBorder(
            radius: Radius.circular(10),
            borderType: BorderType.RRect,
            child: SizedBox(
              height: 45,
              width: double.maxFinite,
              child: ShadButton.ghost(
                onPressed: () {
                  showShadSheet(
                    side: ShadSheetSide.bottom,
                    context: context,
                    builder: (context) => UploadSheet(
                      index: index,
                    ),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey[300]!, width: 1),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}번째 영역",
                    style: ShadTheme.of(context)
                        .textTheme
                        .large
                        .copyWith(height: 1),
                  ),
                  Text(
                    "username",
                    style: ShadTheme.of(context).textTheme.p,
                  ),
                ],
              ),
            ),
            SizedBox(width: 40),
            ShadButton.ghost(
              foregroundColor: Colors.grey[400],
              onPressed: () {
                DetailController.to.deleteImage(index);
              },
              icon: Icon(
                Icons.cancel_sharp,
                size: 24,
              ),
            )
          ],
        ),
      );
    });
  }
}
