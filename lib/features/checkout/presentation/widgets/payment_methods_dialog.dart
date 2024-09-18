import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';
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
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: AppPadding.p8,
            horizontal: AppPadding.p16,
          ),
          child: Builder(builder: (context) {
            final cubit = context.read<CheckoutCubit>();
            return Column(mainAxisSize: MainAxisSize.min, children: [
              PaymentMethodItem(
                onTap: () {
                  cubit.setPaymentMethod(PaymentMethodsEnum.paymob.name);
                },
                title: AppStrings.card,
                svgPath: AssetsManager.card,
              ),
              const Divider(
                height: AppSize.s30,
                color: ColorManager.lightGray,
              ),
              PaymentMethodItem(
                onTap: () {
                  cubit.setPaymentMethod(PaymentMethodsEnum.cash.name);
                },
                title: AppStrings.cash,
                svgPath: AssetsManager.cash,
              ),
            ]);
          }),
        ));
  }
}
