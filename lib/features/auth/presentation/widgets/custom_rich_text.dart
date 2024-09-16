import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = StylesManager.medium16.copyWith(
      color: ColorManager.dark,
      fontFamily: FontConstants.fontFamily,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: RichText(
        text: TextSpan(style: baseStyle, children: <TextSpan>[
          const TextSpan(
            text: 'By placing an order you agree to our ',
          ),
          TextSpan(
            text: 'Terms And Conditions',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log('Terms And Conditions tapped');
              },
            style: baseStyle.copyWith(
              color: ColorManager.primary,
              decorationColor: ColorManager.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ]),
      ),
    );
  }
}
