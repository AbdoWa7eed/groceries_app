import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/animated_arrow_widget.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/nutrition_text_widget.dart';

class ProductNutritionWidget extends StatefulWidget {
  const ProductNutritionWidget({super.key});

  @override
  State<ProductNutritionWidget> createState() => _ProductNutritionWidgetState();
}

class _ProductNutritionWidgetState extends State<ProductNutritionWidget> {
  bool isTurned = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.nutrition,
                  style: StylesManager.semiBold18
                      .copyWith(color: ColorManager.dark),
                ),
              ),
              Container(
                height: AppSize.s24,
                width: AppSize.s45,
                decoration: BoxDecoration(
                    color: ColorManager.softGrey,
                    borderRadius: BorderRadius.circular(AppSize.s4)),
                child: const Center(
                  child: Text(
                    AppStrings.grams,
                    style: StylesManager.medium12,
                  ),
                ),
              ),
              AnimatedArrowWidget(
                onTurn: (value) {
                  setState(() {
                    isTurned = value;
                  });
                },
              ),
            ],
          ),
          Visibility(
            visible: isTurned,
            child: NutritionTextWidget(
                nutritionEntity: context
                    .read<ProductDetailsCubit>()
                    .productDetailsEntity
                    .nutrition),
          ),
        ],
      ),
    );
  }
}
