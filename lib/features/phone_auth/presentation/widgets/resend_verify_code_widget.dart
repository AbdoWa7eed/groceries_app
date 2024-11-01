import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';

class VerifyResendButtonsWidget extends StatefulWidget {
  const VerifyResendButtonsWidget({super.key, required this.code});

  final String code;

  @override
  State<VerifyResendButtonsWidget> createState() =>
      _VerifyResendButtonsWidgetState();
}

class _VerifyResendButtonsWidgetState extends State<VerifyResendButtonsWidget> {
  late Timer _timer;
  late int _currentTime;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _currentTime = 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentTime > 0) {
          setState(() {
            _currentTime--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PhoneAuthCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButtonWidget(
          verticalPadding: AppPadding.p16,
          onPressed: () {
            if (widget.code.length < 6) {
              showSnackBar(context, text: AppStrings.codeIsNotCompleted);
            } else {
              cubit.verifyOTP(code: widget.code);
            }
          },
          child: const Text(
            AppStrings.verify,
            style: StylesManager.semiBold18,
          ),
        ),
        Center(
          child: TextButton(
            onPressed: _currentTime == 0
                ? () {
                    setState(() {
                      cubit.sendOTP();
                      startTimer();
                    });
                  }
                : null,
            child: Text(
              _currentTime == 0
                  ? AppStrings.resendCode
                  : '${AppStrings.resendCode} ($_currentTime s)',
              style: StylesManager.medium14.copyWith(
                color: _currentTime == 0
                    ? ColorManager.primary
                    : ColorManager.darkGray,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
