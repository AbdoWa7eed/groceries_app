import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_list_view_item_model.dart';

class CheckoutListItem extends StatelessWidget {
  const CheckoutListItem({super.key, required this.model});

  final CheckoutListViewItemModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorManager.lightGray,
        onTap: model.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8,
            horizontal: AppPadding.p4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.title,
                style: StylesManager.bold18.copyWith(
                  color: ColorManager.darkGray,
                ),
              ),
              model.suffix
            ],
          ),
        ),
      ),
    );
  }
}
