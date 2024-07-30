import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ProductPriceAndAddButtonWidget extends StatelessWidget {
  const ProductPriceAndAddButtonWidget(
      {super.key,
      required this.price,
      required this.oldPrice});

  final String price;
  final String oldPrice;

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
                '\$$price',
                style: StylesManager.semiBold18.copyWith(
                  color: ColorManager.dark,
                ),
              ),
              Text(
                '\$$oldPrice',
                style: StylesManager.medium14.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){},
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
