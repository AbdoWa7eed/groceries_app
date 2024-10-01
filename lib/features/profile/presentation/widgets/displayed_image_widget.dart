import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/profile/presentation/cubit/profile_cubit.dart';

class DisplayedImageWidget extends StatelessWidget {
  const DisplayedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        if (cubit.image == null) {
          return CustomNetworkImage(
            imageUrl: cubit.user.imageUrl,
            errorImageAssetPath: AssetsManager.userImage,
            height: AppSize.s150,
            width: AppSize.s150,
          );
        }
        return Image.file(
          fit: BoxFit.cover,
          cubit.image!,
          height: AppSize.s150,
          width: AppSize.s150,
        );
      },
    );
  }
}
