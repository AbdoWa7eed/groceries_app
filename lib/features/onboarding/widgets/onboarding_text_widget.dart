import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class OnboardingTextWidget extends StatelessWidget {
  const OnboardingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppPadding.p20),
      child: Column(
        children: [
          Text(AppStrings.onBoardingTitle,
              textAlign: TextAlign.center, style: StylesManager.regular48),
          Text(AppStrings.onBoardingSubtitle,
              textAlign: TextAlign.center, style: StylesManager.medium16),
        ],
      ),
    );
  }
}
