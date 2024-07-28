import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

class AppbarSkipButton extends StatelessWidget {
  const AppbarSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        AppStrings.skip,
        style: StylesManager.medium16.copyWith(
          color: ColorManager.primary
        ),
      ),
    );
  }
}
