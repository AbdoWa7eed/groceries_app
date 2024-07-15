import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          const TextSpan(
            text: 'By continuing you agree to our ',
            style: StylesManager.medium16,
          ),
          TextSpan(
            text: 'Terms of Service',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log('Terms of Service');
              },
            style: StylesManager.medium16.copyWith(
                color: ColorManager.primary,
                decorationColor: ColorManager.primary,
                decoration: TextDecoration.underline),
          ),
          const TextSpan(
            text: ' and ',
            style: StylesManager.medium16,
          ),
          TextSpan(
            text: 'Privacy Policy.',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log('Privacy Policy.');
              },
            style: StylesManager.medium16.copyWith(
                color: ColorManager.primary,
                decorationColor: ColorManager.primary,
                decoration: TextDecoration.underline),
          ),
        ]),
      ),
    );
  }
}
