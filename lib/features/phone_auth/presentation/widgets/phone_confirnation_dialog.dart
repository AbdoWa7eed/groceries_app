import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';

class PhoneConfirmationDialog extends StatelessWidget {
  const PhoneConfirmationDialog({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p16, right: AppPadding.p16, top: AppPadding.p18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  style: StylesManager.medium18
                      .copyWith(fontFamily: FontConstants.fontFamily),
                  children: [
                    const TextSpan(
                      text: "Code will be sent to the number : ",
                    ),
                    TextSpan(
                      text: phoneNumber,
                      style: StylesManager.medium18
                          .copyWith(color: ColorManager.primary),
                    ),
                  ],
                ),
              ),
              CustomElevatedButtonWidget(
                verticalPadding: AppPadding.p18,
                horizontalPadding: AppPadding.p40,
                height: AppSize.s45,
                onPressed: () {
                  context.pop();
                  context.push(Routes.verifyPhoneRoute);
                },
                child: const Text('confirm', style: StylesManager.semiBold18),
              )
            ],
          ),
        ));
  }
}
