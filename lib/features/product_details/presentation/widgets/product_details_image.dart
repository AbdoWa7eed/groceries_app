import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Blur(
          blurColor: ColorManager.imageBackground,
          blur: 10,
          child: AspectRatio(
            aspectRatio: 2 / 1.5,
            child: Container(
              color: ColorManager.imageBackground,
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: AppPadding.p20),
          child: AspectRatio(
            aspectRatio: 2 / 1.5,
            child: CustomNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
