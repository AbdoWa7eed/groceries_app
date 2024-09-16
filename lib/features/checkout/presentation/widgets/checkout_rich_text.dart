import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

class CheckoutRichText extends StatelessWidget {
  const CheckoutRichText({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = StylesManager.regular14.copyWith(
      color: ColorManager.dark,
      fontFamily: FontConstants.fontFamily,
    );
    return RichText(
      text: TextSpan(
        text: AppStrings.placingOrderTerms,
        style: baseStyle,
        children: [
          TextSpan(
            text: AppStrings.termsAndConditions,
            style: baseStyle.copyWith(
              color: ColorManager.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log("Terms And Conditions tapped");
              },
          ),
        ],
      ),
    );
  }
}
