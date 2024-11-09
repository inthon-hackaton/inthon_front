import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';

class MypageProfile extends StatefulWidget {
  const MypageProfile({super.key});

  @override
  _MypageProfileState createState() => _MypageProfileState();
}

class _MypageProfileState extends State<MypageProfile> {
  bool isPressed = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 130,
        height: 130,
        child: Stack(
          children: [
            ECachedImage(
              imageUrl:
                  "https://avatars.githubusercontent.com/u/28894198?v=4&size=128",
              placeHolderRadius: 200,
              imageBuilder: (_, imageProvider) {
                return Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.getColorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            // Obx(() {
            //   // final user = UserService.to.user;
            //   // if (user?.profile_image == null) {
            //   //   return Center(child: Icon(Icons.person, size: 32));
            //   // }
            //   return ECachedImage(
            //     imageUrl: "",
            //     // imageUrl: user!.profile_image!,
            //     placeHolderRadius: 200,
            //     imageBuilder: (_, imageProvider) {
            //       return Container(
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //             image: imageProvider,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       );
            //     },
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
