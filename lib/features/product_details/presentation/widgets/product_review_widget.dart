import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
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
          RatingBar.builder(
            ignoreGestures: true,
            minRating: 0,
            initialRating:
                context.read<ProductDetailsCubit>().productDetailsEntity.rate,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: AppSize.s20,
            glow: false,
            unratedColor: ColorManager.lightGray,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
            itemBuilder: (context, index) {
              return const Icon(Icons.star, color: ColorManager.deepOrange);
            },
            onRatingUpdate: (value) {},
          ),
          IconButton(
              onPressed: () {},
              iconSize: AppSize.s22,
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
