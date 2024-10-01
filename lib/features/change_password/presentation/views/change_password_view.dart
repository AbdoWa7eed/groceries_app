import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/change_password/presentation/views/change_password_listener.dart';
import 'package:groceries_app/features/change_password/presentation/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangePasswordListener(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text(
            AppStrings.changePassword,
            style: StylesManager.semiBold26,
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                color: ColorManager.lightGray,
              )),
        ),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
