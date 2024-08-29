import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_counter_widget.dart';

class CartItemPriceWidget extends StatelessWidget {
  const CartItemPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartItemCounterWidget(
          onQuantityChanged: (value) {},
        ),
        const Text(
          '\$50.00',
          style: StylesManager.bold18,
        )
      ],
    );
  }
}
