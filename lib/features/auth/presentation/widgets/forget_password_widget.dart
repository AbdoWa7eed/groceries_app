import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p28),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.forgotPassword,
              style: StylesManager.medium16.copyWith(color: ColorManager.dark),
            )),
      ),
    );
  }
}
