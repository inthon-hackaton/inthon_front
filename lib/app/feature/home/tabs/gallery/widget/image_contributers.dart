import 'package:flutter/material.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';

class ImageContributers extends StatelessWidget {
  const ImageContributers({Key? key, required this.contributers})
      : super(key: key);

  final List<String> contributers;

  Widget get _user => ECachedImage(
        imageUrl: "https://hugeicons.com/api/png/?uuid=github-stroke-rounded",
        placeHolder: const Icon(Icons.person),
        imageBuilder: (_, imageProvider) {
          return Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey[300]!, width: 1),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30 + 22 * (contributers.length - 1),
      child: Stack(
        children: [
          for (var i = contributers.length - 1; i >= 0; i--)
            Positioned(
              left: 22 * i.toDouble(),
              child: Opacity(
                opacity: i == 0 ? 1 : 0.4,
                child: _user,
              ),
            ),
        ],
      ),
    );
  }
}