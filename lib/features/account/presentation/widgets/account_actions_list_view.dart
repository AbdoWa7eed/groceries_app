import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/features/account/presentation/widgets/action_item_model.dart';
import 'package:groceries_app/features/account/presentation/widgets/action_item_widget.dart';

class ActionsListViewWidget extends StatefulWidget {
  const ActionsListViewWidget({super.key});

  @override
  State<ActionsListViewWidget> createState() => _ActionsListViewWidgetState();
}

class _ActionsListViewWidgetState extends State<ActionsListViewWidget> {
  late final List<ActionItemModel> _actions;

  @override
  void initState() {
    super.initState();
    _actions = _initActionModels;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ActionItemWidget(model: _actions[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorManager.lightGray,
          );
        },
        itemCount: _actions.length);
  }

  List<ActionItemModel> get _initActionModels => [
        ActionItemModel(
          title: AppStrings.myOrders,
          assetImagePath: AssetsManager.ordersIcon,
          onTab: () {},
        ),
        ActionItemModel(
          title: AppStrings.personalDetails,
          assetImagePath: AssetsManager.detailsIcon,
          onTab: () {
            context.push(Routes.profileRoute);
          },
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
