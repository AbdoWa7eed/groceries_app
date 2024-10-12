import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class ReviewerImageWidget extends StatelessWidget {
  const ReviewerImageWidget({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s20,
      backgroundColor: ColorManager.primaryWith10Opacity,
      child: CustomNetworkImage(
        imageBuilder: (context, imageProvider) {
          return CircleAvatar(
            foregroundImage: imageProvider,
            radius: AppSize.s20,
          );
        },
        imageUrl: imageUrl,
        errorImageAssetPath: AssetsManager.userImage,
      ),
    );
  }
}
