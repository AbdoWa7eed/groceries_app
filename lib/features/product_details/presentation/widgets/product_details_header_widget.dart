import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_image.dart';

class ProductsDetailsHeader extends StatelessWidget {
  const ProductsDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        color: ColorManager.imageBackground,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s40),
            bottomRight: Radius.circular(AppSize.s40)),
      ),
      child: const Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: kToolbarHeight),
            child: ProductDetailsImage(
              imageUrl: 'https://iili.io/duNdlcl.png',
            ),
          ),
          Positioned(
            top: kToolbarHeight / 2,
            child: CustomBackButton(),
          )
        ],
      ),
    );
  }
}
