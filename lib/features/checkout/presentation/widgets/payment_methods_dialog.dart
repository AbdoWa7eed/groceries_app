import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/payment_method_item.dart';

class PaymentMethodsDialog extends StatelessWidget {
  const PaymentMethodsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4),
        ),
        child: const Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: AppPadding.p8,
            horizontal: AppPadding.p16,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            PaymentMethodItem(
              title: AppStrings.card,
              svgPath: AssetsManager.card,
            ),
            Divider(
              height: AppSize.s30,
              color: ColorManager.lightGray,
            ),
            PaymentMethodItem(
              title: AppStrings.cash,
              svgPath: AssetsManager.cash,
            ),
          ]),
        ));
  }
}
