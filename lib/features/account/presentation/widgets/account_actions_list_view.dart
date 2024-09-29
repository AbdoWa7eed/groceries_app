import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/account/presentation/widgets/action_item_model.dart';
import 'package:groceries_app/features/account/presentation/widgets/action_item_widget.dart';

class ActionsListViewWidget extends StatelessWidget {
  const ActionsListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ActionItemWidget(model: actionModels[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorManager.lightGray,
          );
        },
        itemCount: actionModels.length);
  }

  static final List<ActionItemModel> actionModels = [
    ActionItemModel(
      title: AppStrings.myOrders,
      assetImagePath: AssetsManager.ordersIcon,
      onTab: () {},
    ),
    ActionItemModel(
      title: AppStrings.myDetails,
      assetImagePath: AssetsManager.detailsIcon,
      onTab: () {},
    ),
    ActionItemModel(
      title: AppStrings.help,
      assetImagePath: AssetsManager.helpIcon,
      onTab: () {},
    ),
    ActionItemModel(
      title: AppStrings.aboutUs,
      assetImagePath: AssetsManager.aboutIcon,
      onTab: () {},
    ),
  ];
}
