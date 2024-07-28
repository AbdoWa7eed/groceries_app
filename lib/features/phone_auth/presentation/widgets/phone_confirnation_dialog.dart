import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/confirmation_dialog_widget.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';

class PhoneConfirmationDialog extends StatelessWidget {
  const PhoneConfirmationDialog({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        final cubit = context.read<PhoneAuthCubit>();
        return ConfirmationDialogWidget(
          isLoading: state is SendOTPLoadingState,
          onPressed: () {
            cubit.sendOTP(phoneNumber);
          },
          child: RichText(
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
        );
      },
    );
  }
}
