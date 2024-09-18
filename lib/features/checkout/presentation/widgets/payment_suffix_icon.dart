import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';

class PaymentSuffixIcon extends StatelessWidget {
  const PaymentSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        if (cubit.paymentMethod == PaymentMethodsEnum.cash.name) {
          return SvgPicture.asset(
            AssetsManager.cash,
            height: AppSize.s24,
            width: AppSize.s24,
          );
        }
        return SvgPicture.asset(
          AssetsManager.card,
          height: AppSize.s24,
          width: AppSize.s24,
        );
      },
    );
  }
}
