import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class SectionTextWidget extends StatelessWidget {
  final String text;
  final Function()? onSeeAllPressed;
  const SectionTextWidget(
      {super.key, required this.text, required this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: StylesManager.semiBold22,
          ),
          GestureDetector(
            onTap: onSeeAllPressed,
            child: Text(
              AppStrings.seeAll,
              style:
                  StylesManager.medium18.copyWith(color: ColorManager.primary),
            ),
          ),
        ],
      ),
    );
  }
}
