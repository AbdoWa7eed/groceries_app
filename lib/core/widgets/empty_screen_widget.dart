import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({
    super.key,
    required this.text,
    this.onTryAgain,
  });

  final String text;
  final Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            AssetsManager.emptyCartJson,
            height: AppSize.s200,
            width: AppSize.s200,
          ),
          Text(
            text,
            style: StylesManager.medium18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSize.s16),
          Visibility(
            visible: onTryAgain != null,
            child: TextButton(
              onPressed: onTryAgain,
              child: const Text(AppStrings.reload),
            ),
          )
        ],
      ),
    );
  }
}
