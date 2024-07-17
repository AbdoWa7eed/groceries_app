import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
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
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        final cubit = context.read<PhoneAuthCubit>();
        return Row(
          children: [
            Expanded(
              child: CustomElevatedButtonWidget(
                  onPressed: _currentTime == 0
                      ? () {
                          setState(() {
                            cubit.sendOTP();
                            startTimer();
                          });
                        }
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.resendCode,
                          style: StylesManager.medium14.copyWith(
                              color: _currentTime == 0
                                  ? ColorManager.white
                                  : ColorManager.primary)),
                      Visibility(
                        visible: _currentTime != 0,
                        child: Text('$_currentTime s',
                            style: StylesManager.medium14.copyWith(
                                color: _currentTime == 0
                                    ? ColorManager.white
                                    : ColorManager.primary)),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: CustomElevatedButtonWidget(
              onPressed: () {
                if ((cubit.code?.length ?? 0) < 6) {
                  showSnackBar(context, text: AppStrings.codeIsNotCompleted);
                } else {
                  cubit.verifyOTP();
                }
              },
              child: Text(
                AppStrings.verify,
                style:
                    StylesManager.medium14.copyWith(color: ColorManager.white),
              ),
            )),
          ],
        );
      },
    );
  }
}
