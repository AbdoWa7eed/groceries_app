import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ConfirmPaymentLoadingDialog extends StatelessWidget {
  const ConfirmPaymentLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please wait for a second",
              style: StylesManager.regular16,
            ),
            SizedBox(height: AppSize.s20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
