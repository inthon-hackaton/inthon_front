import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class UploadSheetOtherItem extends StatelessWidget {
  const UploadSheetOtherItem({
    Key? key,
    this.isLoadingWidget = false,
    required this.isSelected,
  }) : super(key: key);

  final bool isLoadingWidget;
  final bool isSelected;

  factory UploadSheetOtherItem.loading() {
    return UploadSheetOtherItem(
      isLoadingWidget: true,
      isSelected: false,
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
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? context.getColorScheme.primary
                : Colors.transparent,
            width: 1,
          ),
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
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                child: SizedBox(
                  width: 80,
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
                  Row(
                    children: [
                      ECachedImage(
                        imageUrl:
                            "https://hugeicons.com/api/png/?uuid=github-stroke-rounded",
                        placeHolder: const Icon(Icons.person),
                        imageBuilder: (_, imageProvider) {
                          return Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Colors.grey[300]!, width: 1),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Author",
                        style: ShadTheme.of(context).textTheme.h4,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "32명",
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                color: context.getColorScheme.primary,
                              ),
                        ),
                        TextSpan(
                          text: "이 함께 만들었어요",
                          style: ShadTheme.of(context).textTheme.muted,
                        ),
                      ],
                    ),
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
