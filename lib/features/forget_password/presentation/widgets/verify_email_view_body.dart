import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/code_input_widget.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.enterEmailCode, style: StylesManager.bold18),
            const SizedBox(height: AppSize.s20),
            const CodeInputWidget(),
            const SizedBox(height: AppSize.s20),
            CustomElevatedButtonWidget(
                onPressed: () {
                  context.push(Routes.resetPassword);
                },
                child: const Text(
                  AppStrings.verify,
                  style: StylesManager.semiBold18,
                )),
          ],
        ),
      ),
    );
  }
}
