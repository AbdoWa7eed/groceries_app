import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_counter_widget.dart';

class CartItemPriceWidget extends StatefulWidget {
  const CartItemPriceWidget({super.key, required this.cartItem});
  final CartItemEntity cartItem;
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
          initialValue: widget.cartItem.quantity,
          onQuantityChanged: (value) {
            context.read<CartCubit>().updateItemQuantity(
                  widget.cartItem.product.productId,
                  value,
                );
          },
        ),
        Text(
          '$totalPrice\$',
          style: StylesManager.bold18,
        )
      ],
    );
  }

  String get totalPrice =>
      (widget.cartItem.product.price * widget.cartItem.quantity)
          .toStringAsFixed(2);
}
