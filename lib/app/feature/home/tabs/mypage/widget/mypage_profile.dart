import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/user_service.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/logic/mypage_controller.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';

class MypageProfile extends StatefulWidget {
  const MypageProfile({super.key, required this.isEditable});

  final bool isEditable;

  @override
  _MypageProfileState createState() => _MypageProfileState();
}

class _MypageProfileState extends State<MypageProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.isEditable ? () => MypageController.to.onTapProfile() : null,
      child: SizedBox(
        width: 130,
        height: 130,
        child: Stack(
          children: [
            Obx(() {
              final pickedImage = MypageController.to.pickedImage;

              if (pickedImage != null) {
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
                        image: Image.file(File(pickedImage.path)).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }

              final user = UserService.to.user;
              if (user?.picture_url == null || user?.picture_url == "") {
                return Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.getColorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.person, size: 32),
                  ),
                );
              }

              return ECachedImage(
                imageUrl: user!.picture_url,
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
              );
            }),
            if (widget.isEditable)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: context.getColorScheme.primary,
                      size: 28,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
