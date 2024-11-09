import 'package:flutter/material.dart';
import 'package:inthon_front/app/theme/app_theme.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ListCard extends StatelessWidget {
  final String name;
  final int people;
  final Function onTap;
  final String? imageUrl;
  final String? userImage1;
  final String? userImage2;
  final String? userImage3;
  const ListCard({
    super.key,
    required this.name,
    required this.people,
    required this.onTap,
    this.imageUrl,
    this.userImage1,
    this.userImage2,
    this.userImage3,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTap(),
      child: Container(
        // color: Colors.lightGreen,
        decoration: BoxDecoration(
          // color: Color(lime50),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        // height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            imageUrl != null
                ? ShadCard(
                    radius: BorderRadius.circular(18),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    child: SizedBox(
                        width: 100,
                        height: 80,
                        child: ECachedImage(imageUrl: imageUrl!)),
                  )
                : SizedBox(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      userImage1 != null &&
                              userImage2 != null &&
                              userImage3 != null
                          ? SizedBox(
                              width: 46,
                              height: 25,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 24,
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: ECachedImage(
                                          imageUrl: userImage1!,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 12,
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: ECachedImage(
                                          imageUrl: userImage2!,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: ECachedImage(
                                          imageUrl: userImage3!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
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
            SizedBox(
              width: 40,
            ),
            // 오른쪽 화살표
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              // color: Color(lime500),

              color: Colors.grey[400],
            )
          ],
        ),
      ),
    );
  }
}
