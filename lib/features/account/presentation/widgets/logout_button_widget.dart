import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: CustomElevatedButtonWidget(
        verticalPadding: 0,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.lightGray2,
        ),
        onPressed: () {
          log('Log out button');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout_rounded,
              color: ColorManager.primary,
            ),
            const Spacer(),
            Text(AppStrings.logout,
                style: StylesManager.semiBold18
                    .copyWith(color: ColorManager.primary)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
