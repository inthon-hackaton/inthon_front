import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/image_contributers.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class ListCard extends StatelessWidget {
  final String name;
  final int people;
  final String imageUrl;
  final bool isLoadingWidget;
  const ListCard({
    super.key,
    required this.name,
    required this.people,
    required this.imageUrl,
    this.isLoadingWidget = false,
  });

  factory ListCard.loading() {
    return ListCard(
      name: "",
      people: 0,
      imageUrl: "",
      isLoadingWidget: true,
    );
  }
  Widget get _loadingWidget {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    height: 24,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingWidget) {
      return _loadingWidget;
    }
    return InkWell(
      onTap: () {
        context.push('/detail');
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ShadCard(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: 100,
                  height: 80,
                  child: ECachedImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1517219039361-66f283bce5db?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D",
                  ),
                ),
              ),
            ),

            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      ImageContributers(
                        contributers: ["민준", "준희", "의찬", "다영"],
                      ),
                      SizedBox(width: 5),
                      Text(
                        "+$people",
                        style: ShadTheme.of(context).textTheme.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            // 오른쪽 화살표
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }
}
