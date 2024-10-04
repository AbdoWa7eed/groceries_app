import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/forget_password/presentation/views/forget_password_listener.dart';
import 'package:groceries_app/features/forget_password/presentation/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgetPasswordListener(
      onSuccess: (_) => context.push(Routes.resetPassword),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text(
            AppStrings.verification,
            style: StylesManager.semiBold26,
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                color: ColorManager.lightGray,
              )),
        ),
        body: const VerifyEmailViewBody(),
      ),
    );
  }
}
