import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';

class NutritionTextWidget extends StatelessWidget {
  const NutritionTextWidget({super.key, required this.nutritionEntity});
  final NutritionEntity? nutritionEntity;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (nutritionEntity == null) {
        return const Text(
          textAlign: TextAlign.start,
          AppStrings.noNutritionData,
          style: StylesManager.medium14,
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNutritionText(
              'Calories : ', nutritionEntity!.calories.toString()),
          _buildNutritionText('Protein : ', '${nutritionEntity!.protein}g'),
          _buildNutritionText('Carbs : ', '${nutritionEntity!.carb}g'),
        ],
      );
    });
  }

  Widget _buildNutritionText(String text, String value) {
    return Row(
      children: [
        Text(
          text,
          style: StylesManager.medium14,
        ),
        Text(value,
            style: StylesManager.medium14.copyWith(
              color: ColorManager.primary,
            )),
      ],
    );
  }
}
