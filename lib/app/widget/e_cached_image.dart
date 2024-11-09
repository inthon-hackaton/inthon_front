import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';

class ECachedImage extends StatelessWidget {
  const ECachedImage({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.cacheWidth,
    this.cacheHeight,
    this.boxFit,
    this.placeHolder,
    this.fadeInDuration,
    this.placeHolderRadius,
  });

  final String imageUrl;
  final Widget Function(BuildContext _, ImageProvider<Object> imageProvider)?
      imageBuilder;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? boxFit;
  final Widget? placeHolder;
  final Duration? fadeInDuration;
  final double? placeHolderRadius;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.trim().isEmpty) {
      return Container();
    }

    return CachedNetworkImage(
      errorWidget: ((context, url, error) {
        debugPrint("error $error");
        debugPrint("url $url");
        return Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.error,
              color: Colors.grey[500],
            ),
          ),
        );
      }),
      imageBuilder: imageBuilder,
      imageUrl: imageUrl,
      fit: boxFit ?? BoxFit.cover,
      fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      placeholder: placeHolder != null
          ? ((c, u) => placeHolder!)
          : (context, url) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(placeHolderRadius ?? 0),
                ),
              ),
      memCacheHeight: cacheHeight == null
          ? null
          : (cacheHeight! * context.getDevicePixelRatio).floor(),
      memCacheWidth: cacheWidth == null
          ? null
          : (cacheWidth! * context.getDevicePixelRatio).floor(),
    );
  }
}
