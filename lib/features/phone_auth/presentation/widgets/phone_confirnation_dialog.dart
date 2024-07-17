import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';

class PhoneConfirmationDialog extends StatelessWidget {
  const PhoneConfirmationDialog({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        final cubit = context.read<PhoneAuthCubit>();
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.p16,
                right: AppPadding.p16,
                top: AppPadding.p18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    style: StylesManager.medium18
                        .copyWith(fontFamily: FontConstants.fontFamily),
                    children: [
                      const TextSpan(
                        text: AppStrings.codeWillBeSentTo,
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
                  isLoading: state is SendOTPLoadingState,
                  verticalPadding: AppPadding.p18,
                  horizontalPadding: AppPadding.p40,
                  height: AppSize.s45,
                  onPressed: () {
                    cubit.sendOTP(phoneNumber);
                  },
                  child: const Text(
                    AppStrings.confirm,
                    style: StylesManager.semiBold18,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
