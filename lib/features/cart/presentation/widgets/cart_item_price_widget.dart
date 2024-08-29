import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_counter_widget.dart';

class CartItemPriceWidget extends StatefulWidget {
  const CartItemPriceWidget({super.key});

  @override
  State<CartItemPriceWidget> createState() => _CartItemPriceWidgetState();
}

class _CartItemPriceWidgetState extends State<CartItemPriceWidget>
    with AutomaticKeepAliveClientMixin<CartItemPriceWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
