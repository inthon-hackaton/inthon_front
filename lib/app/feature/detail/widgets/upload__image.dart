import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.isEditable});

  final bool isEditable;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool isPressed = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEditable ? () => DetailController.to.onTapUpload() : null,
      child: Stack(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ECachedImage(
              imageUrl:
                  "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
              placeHolderRadius: 200,
              imageBuilder: (_, imageProvider) {
                return Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: context.getColorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
