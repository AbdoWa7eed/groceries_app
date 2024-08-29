import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';

class CartItemHeaderWidget extends StatelessWidget {
  const CartItemHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductTitleWidget(
            description: 'description', productName: 'Product Name'),
        Icon(
          Icons.close,
          color: ColorManager.gray,
        ),
      ],
    );
  }
}
