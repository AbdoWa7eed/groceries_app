import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.errorImageAssetPath = AssetsManager.noProductImage,
      this.fit = BoxFit.cover,
      this.imageBuilder});

  final double? width;
  final double? height;
  final String imageUrl;
  final BoxFit fit;
  final String errorImageAssetPath;
  final Widget Function(BuildContext context, ImageProvider imageProvider)?
      imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      fit: fit,
      errorWidget: (context, url, error) {
        return Image.asset(errorImageAssetPath);
      },
    );
  }
}
