import 'package:flutter/material.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';

class ImageContributers extends StatelessWidget {
  const ImageContributers({
    Key? key,
    required this.contributers,
    this.highlightFirst = false,
  }) : super(key: key);

  final List<String> contributers;
  final bool highlightFirst;

  Widget _user(String url) => ECachedImage(
        imageUrl: url,
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
                opacity: highlightFirst
                    ? i == 0
                        ? 1
                        : 0.4
                    : 1,
                child: _user(contributers[i]),
              ),
            ),
        ],
      ),
    );
  }
}
