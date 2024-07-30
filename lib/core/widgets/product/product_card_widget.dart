import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/product/product_image_widget.dart';
import 'package:groceries_app/core/widgets/product/product_price_widget.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: Card(
        elevation: 0,
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
            side: const BorderSide(color: ColorManager.lightGray)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageWidget(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2017/08/10/23/55/png-2629072_1280.png'),
              ProductTitleWidget(
                  productDetails: '1kg, Priceg',
                  productName: 'Bell Pepper Red'),
              ProductPriceAndAddButtonWidget(
                price: '1.99',
                oldPrice: '2.99',
              )
            ],
          ),
        ),
      ),
    );
  }
}
