import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class AuthTextWidget extends StatelessWidget {
  final String title;
  final String subtitleText;
  const AuthTextWidget(
      {super.key, required this.title, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: StylesManager.regular26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p20),
          child: Text(subtitleText,
              textAlign: TextAlign.start,
              style: StylesManager.medium16.copyWith(
                color: ColorManager.darkGray,
              )),
        ),
      ],
    );
  }
}
