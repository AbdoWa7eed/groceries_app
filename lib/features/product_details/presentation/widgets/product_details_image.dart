import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Blur(
          blurColor: ColorManager.imageBackground,
          blur: 10,
          child: Container(
              height: height,
              width: double.infinity,
              color: ColorManager.imageBackground,
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              )),
        ),
        CustomNetworkImage(
          height: height - 15,
          width: double.infinity,
          imageUrl: imageUrl,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
