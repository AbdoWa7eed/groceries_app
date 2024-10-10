import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_rating_widget.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.review,
              style:
                  StylesManager.semiBold18.copyWith(color: ColorManager.dark),
            ),
          ),
          CustomRatingWidget(
            initialRating:
                context.read<ProductDetailsCubit>().productDetailsEntity.rate,
          ),
          IconButton(
              onPressed: () {
                context.push(Routes.reviewsRoute);
              },
              iconSize: AppSize.s22,
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
