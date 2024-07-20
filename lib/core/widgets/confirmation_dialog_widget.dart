import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  const ConfirmationDialogWidget(
      {super.key,
      required this.child,
      this.isLoading = false,
      required this.onPressed});
  final Widget child;
  final bool isLoading;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p16, right: AppPadding.p16, top: AppPadding.p18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            CustomElevatedButtonWidget(
              isLoading: isLoading,
              verticalPadding: AppPadding.p18,
              horizontalPadding: AppPadding.p40,
              height: AppSize.s45,
              onPressed: onPressed,
              child: const Text(
                AppStrings.confirm,
                style: StylesManager.semiBold18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
