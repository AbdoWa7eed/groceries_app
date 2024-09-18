import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';

class PlaceOrderButtonWidget extends StatelessWidget {
  const PlaceOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is PlaceOrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomElevatedButtonWidget(
            verticalPadding: 0,
            child: const Text(
              AppStrings.placeOrder,
              style: StylesManager.semiBold18,
            ),
            onPressed: () {
              context.read<CheckoutCubit>().placeOrder();
            },
          );
        },
      ),
    );
  }
}
