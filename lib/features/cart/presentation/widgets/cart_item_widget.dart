import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_header_widget.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_price_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 140,
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: '',
            fit: BoxFit.contain,
            height: 80,
            width: 80,
          ),
          SizedBox(width: AppSize.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CartItemHeaderWidget(),
                CartItemPriceWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
