import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_header_widget.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_price_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetails, extra: cartItem.product.productId);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: cartItem.product.imageUrl,
              fit: BoxFit.contain,
              height: 80,
              width: 80,
            ),
            const SizedBox(width: AppSize.s12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CartItemHeaderWidget(
                    product: cartItem.product,
                  ),
                  CartItemPriceWidget(
                    cartItem: cartItem,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
