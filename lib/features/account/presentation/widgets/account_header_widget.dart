import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:groceries_app/features/account/presentation/widgets/user_info_text_widget.dart';

class AccountViewHeaderWidget extends StatelessWidget {
  const AccountViewHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AccountCubit cubit) => cubit.user);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p18,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: ColorManager.primaryWith10Opacity,
                borderRadius: BorderRadius.circular(AppSize.s12)),
            child: CustomNetworkImage(
              imageUrl: user.imageUrl,
              errorImageAssetPath: AssetsManager.userImage,
              height: AppSize.s80,
              width: AppSize.s80,
            ),
          ),
          const SizedBox(
            width: AppSize.s18,
          ),
          const UserInfoTextWidget(),
        ],
      ),
    );
  }
}
