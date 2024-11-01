import 'package:flutter/material.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/product/product_card_widget.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductCardWidget(entity: products[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: AppSize.s8,
            );
          },
          itemCount: products.length),
    );
  }
}
