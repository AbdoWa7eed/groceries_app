import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class SubmitReviewButton extends StatelessWidget {
  const SubmitReviewButton(
      {super.key, required this.onPressed, required this.text});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        onPressed: onPressed,
        child: Text(
          text,
          style: StylesManager.semiBold18,
        ));
  }
}
