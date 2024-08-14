import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
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
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is GetProductDetailsError) {
          return CustomErrorWidget(error: state.message);
        }

        if (state is GetProductDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            const ProductsDetailsHeader(),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p26),
              child: Column(
                children: [
                  const ProductDetailsNameWidget(),
                  const ProductDetailsPriceWidget(),
                  const Divider(color: ColorManager.lightGray),
                  const ProductDetailsTextWidget(),
                  const Divider(color: ColorManager.lightGray),
                  const ProductNutritionWidget(),
                  const Divider(color: ColorManager.lightGray),
                  const ProductReviewWidget(),
                  CustomElevatedButtonWidget(
                    child: Text(AppStrings.addToBasket,
                        style: StylesManager.semiBold18
                            .copyWith(color: ColorManager.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
