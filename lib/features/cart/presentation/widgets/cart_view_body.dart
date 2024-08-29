import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const CartListView(),
          CustomElevatedButtonWidget(
              verticalPadding: AppPadding.p12,
              child: const Text(
                'Checkout',
                style: StylesManager.semiBold18,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
