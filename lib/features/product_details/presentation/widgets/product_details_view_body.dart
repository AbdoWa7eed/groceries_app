import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_header_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_price_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_text.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_name_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_nutrition_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_review_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ProductsDetailsHeader(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p26),
            child: Column(
              children: [
                ProductDetailsNameWidget(),
                ProductDetailsPriceWidget(price: 1.29),
                Divider(color: ColorManager.lightGray),
                ProductDetailsTextWidget(
                  productDetails:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting"
                      "industry. Lorem Ipsum has been the industry's standard dummy"
                      "text ever since the 1500s"
                      "Lorem Ipsum is simply dummy text of the printing and typesetting"
                      "industry. Lorem Ipsum has been the industry's standard dummy"
                      "text ever since the 1500s",
                ),
                Divider(color: ColorManager.lightGray),
                ProductNutritionWidget(),
                Divider(color: ColorManager.lightGray),
                ProductReviewWidget(),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: CustomElevatedButtonWidget(
                horizontalPadding: AppPadding.p26,
                child: Text(AppStrings.addToBasket,
                    style: StylesManager.semiBold18
                        .copyWith(color: ColorManager.white)),
                onPressed: () {},
              )),
        ),
      ],
    );
  }
}
