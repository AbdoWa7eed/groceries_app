import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/product/product_image_widget.dart';
import 'package:groceries_app/core/widgets/product/product_price_widget.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.entity});
  final ProductEntity entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetails, extra: entity.productId);
      },
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Card(
          elevation: 0,
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
              side: const BorderSide(color: ColorManager.lightGray)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageWidget(imageUrl: entity.imageUrl),
                ProductTitleWidget(
                    description: entity.description, productName: entity.name),
                ProductPriceAndAddButtonWidget(
                  product: entity,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
