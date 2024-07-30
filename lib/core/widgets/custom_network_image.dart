import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover});
  final double? width;
  final double? height;
  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) {
        return SizedBox(
          height: height,
          width: width,
          child: const Icon(Icons.error));
      },
    );
  }
}
