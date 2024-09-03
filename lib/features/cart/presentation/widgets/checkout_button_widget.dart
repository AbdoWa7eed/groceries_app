import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';

class CheckoutButtonWidget extends StatelessWidget {
  const CheckoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        return CustomElevatedButtonWidget(
            verticalPadding: AppPadding.p12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  AppStrings.checkout,
                  style: StylesManager.semiBold18,
                ),
                Container(
                  height: AppSize.s22,
                  width: AppSize.s45,
                  decoration: BoxDecoration(
                      color: ColorManager.dark.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppSize.s4))),
                  child: Text(
                    '${cubit.cartPrice}\$',
                    style: StylesManager.semiBold14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPressed: () {});
      },
    );
  }
}
