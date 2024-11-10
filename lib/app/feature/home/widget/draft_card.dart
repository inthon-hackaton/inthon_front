import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/image_contributers.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class DraftCard extends StatelessWidget {
  // final String name;
  // final int people;
  // final String imageUrl;
  final Draft draft;
  final bool isLoadingWidget;
  const DraftCard({
    super.key,
    required this.draft,
    this.isLoadingWidget = false,
  });

  factory DraftCard.loading() {
    return DraftCard(
      draft: Draft(
        draft_id: 0,
        draft_link:
            "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
        draft_used_count: 0,
        description: "도안 설명",
        draft_user_list: [],
      ),
      isLoadingWidget: true,
    );
  }
  Widget get _loadingWidget {
    return GestureDetector(
      onTap: () => RouterService.to.goRouter.push('/detail', extra: draft),
      child: Padding(
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
                width: 80,
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
        context.push('/detail', extra: draft);
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
                  width: 80,
                  height: 80,
                  child: ECachedImage(
                    imageUrl: draft.draft_link,
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
                    draft.description,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  SizedBox(height: 5),
                  draft.draft_used_count == 0
                      ? Text(
                          "아직 조각이 만들어지는 중이에요!",
                          style: ShadTheme.of(context).textTheme.muted,
                        )
                      : Row(
                          children: [
                            ImageContributers(
                              contributers: draft.draft_user_list,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "+${draft.draft_used_count}",
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
