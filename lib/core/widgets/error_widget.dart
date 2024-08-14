import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    this.onTryAgain,
  });
  final String error;
  final Function()? onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        LottieBuilder.asset(
          AssetsManager.errorJson,
          height: AppSize.s120,
          width: AppSize.s120,
        ),
        Text(
          error,
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
    );
  }
}
