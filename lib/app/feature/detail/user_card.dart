import 'package:flutter/material.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UserCard extends StatelessWidget {
  final int index;
  final String userId;
  final String userProfile;
  const UserCard({
    super.key,
    required this.index,
    required this.userId,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      // onTap: () => onTap(),
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
            ShadCard(
              radius: BorderRadius.circular(18),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0,
              ),
              child: SizedBox(
                  width: 50,
                  height: 40,
                  child: ECachedImage(imageUrl: userProfile)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$index번째 영역",
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        userId,
                        style: ShadTheme.of(context).textTheme.p,
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
              Icons.cancel_sharp,
              size: 24,
              color: Colors.grey[400],
            )
          ],
        ),
      ),
    );
  }
}
