import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton(
      {super.key, required this.condition, required this.text, this.onPressed});

  final bool condition;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (condition) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return CustomElevatedButtonWidget(
            verticalPadding: AppPadding.p8,
            onPressed: onPressed,
            child: Text(
              text,
              style: StylesManager.semiBold18,
            ),
          );
        }
      },
    );
  }
}
