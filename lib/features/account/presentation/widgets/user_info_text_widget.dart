import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';

class UserInfoTextWidget extends StatelessWidget {
  const UserInfoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AccountCubit cubit) => cubit.user);
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.username, maxLines: 1, style: StylesManager.bold18),
        Text(user.email, style: StylesManager.regular16),
        Visibility(
            visible: user.address != null || user.address!.isEmpty,
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.addressIcon,
                  colorFilter: const ColorFilter.mode(
                      ColorManager.darkGray, BlendMode.srcIn),
                  width: AppSize.s16,
                  height: AppSize.s16,
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Expanded(
                  child: Text(
                    formattedAddress(user.address!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StylesManager.regular16,
                  ),
                ),
              ],
            ))
      ],
    ));
  }

  String formattedAddress(String address) {
    final parts = address.split(',');
    if (parts.length == 1) {
      return parts.first;
    }
    return '${parts.first},${parts[1]}';
  }
}
