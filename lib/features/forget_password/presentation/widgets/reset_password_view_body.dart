import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/password_field_widget.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.resetPassword, style: StylesManager.bold18),
            const SizedBox(height: AppSize.s20),
            const PasswordFieldWidget(labelText: AppStrings.newPassword),
            const SizedBox(height: AppSize.s20),
            const PasswordFieldWidget(labelText: AppStrings.confirmPassword),
            const SizedBox(height: AppSize.s20),
            CustomElevatedButtonWidget(
                onPressed: () {},
                child: const Text(
                  AppStrings.resetPassword,
                  style: StylesManager.semiBold18,
                )),
          ],
        ),
      ),
    );
  }
}
