import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ToggleAuthScreensWidget extends StatelessWidget {
  final String descriptionText;
  final String buttonText;
  final Function()? onButtonPressed;
  const ToggleAuthScreensWidget(
      {super.key,
      required this.descriptionText,
      required this.buttonText,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            descriptionText,
            style: StylesManager.medium16.copyWith(color: ColorManager.dark),
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
          TextButton(
              onPressed: onButtonPressed,
              child: Text(
                buttonText,
                style: StylesManager.medium16.copyWith(
                  color: ColorManager.primary,
                ),
              )),
        ],
      ),
    );
  }
}
