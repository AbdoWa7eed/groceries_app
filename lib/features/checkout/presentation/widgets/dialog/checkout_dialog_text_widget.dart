import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CheckoutDialogTextWidget extends StatelessWidget {
  const CheckoutDialogTextWidget(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: StylesManager.bold24,
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: StylesManager.medium16,
          ),
        ],
      ),
    );
  }
}
