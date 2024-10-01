import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/profile/presentation/widgets/pick_image_button_widget.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Allow the CircleAvatar to be outside the image bounds
      alignment: AlignmentDirectional.center, // Aligns image at the center
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: ColorManager.primaryWith10Opacity,
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: const CustomNetworkImage(
            imageUrl: 'user.imageUrl',
            errorImageAssetPath: AssetsManager.userImage,
            height: AppSize.s150,
            width: AppSize.s150,
          ),
        ),
        const Positioned(
          bottom: -AppSize.s8,
          right: -AppSize.s8,
          child: PickImageButtonWidget(),
        ),
      ],
    );
  }
}
