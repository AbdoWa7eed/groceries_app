import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';

class CartItemHeaderWidget extends StatelessWidget {
  const CartItemHeaderWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ProductTitleWidget(
            description: product.description,
            productName: product.name,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().removeFromCart(product.productId);
          },
          child: const Icon(
            Icons.close,
            color: ColorManager.gray,
          ),
        ),
      ],
    );
  }
}
