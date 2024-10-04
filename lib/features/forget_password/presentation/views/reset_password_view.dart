import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/forget_password/presentation/views/forget_password_listener.dart';
import 'package:groceries_app/features/forget_password/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgetPasswordListener(
      onSuccess: (_) => context.popAllThenPush(Routes.homeRoute),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text(
            AppStrings.resetPassword,
            style: StylesManager.semiBold26,
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                color: ColorManager.lightGray,
              )),
        ),
        body: const ResetPasswordViewBody(),
      ),
    );
  }
}
