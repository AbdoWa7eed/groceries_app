import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ReviewBottomSheetTextWidget extends StatelessWidget {
  const ReviewBottomSheetTextWidget(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: StylesManager.bold18,
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        Text(
          subtitle,
          style: StylesManager.regular16,
        ),
      ],
    );
  }
}
