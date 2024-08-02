import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ProductNutritionWidget extends StatelessWidget {
  const ProductNutritionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.nutrition,
              style:
                  StylesManager.semiBold18.copyWith(color: ColorManager.dark),
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
                '100gr',
                style: StylesManager.medium12,
              ),
            ),
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
