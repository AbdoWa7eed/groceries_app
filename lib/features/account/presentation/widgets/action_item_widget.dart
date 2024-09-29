import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/account/presentation/widgets/action_item_model.dart';

class ActionItemWidget extends StatelessWidget {
  const ActionItemWidget({super.key, required this.model});

  final ActionItemModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2),
      title: Text(
        model.title,
        style: StylesManager.semiBold18.copyWith(color: ColorManager.dark),
      ),
      contentPadding:
          const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p8),
      leading: SvgPicture.asset(
        model.assetImagePath,
        height: AppSize.s22,
        width: AppSize.s22,
      ),
      onTap: model.onTab,
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
