import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';

class ProductPriceAndAddButtonWidget extends StatelessWidget {
  const ProductPriceAndAddButtonWidget({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p16, bottom: AppPadding.p14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$${product.price}',
                style: StylesManager.semiBold18.copyWith(
                  color: ColorManager.dark,
                ),
              ),
              Visibility(
                visible:
                    product.unitPrice.toString() != product.price.toString(),
                child: Text(
                  '\$${product.unitPrice}',
                  style: StylesManager.medium14.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<CartCubit>().addToCart(product.productId);
            },
            child: Container(
              height: AppSize.s40,
              width: AppSize.s40,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(AppSize.s14),
              ),
              child: const Icon(
                Icons.add,
                color: ColorManager.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
