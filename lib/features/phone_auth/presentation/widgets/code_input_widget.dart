import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:pinput/pinput.dart';

class CodeInputWidget extends StatelessWidget {
  const CodeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        final cubit = context.read<PhoneAuthCubit>();
        return Pinput(
          length: 6,
          onCompleted: (value) {
            cubit.setCode(value);
          },
          onSubmitted: (value) {
            cubit.setCode(value);
          },
          onChanged: (value) {
            cubit.setCode(value);
          },
          defaultPinTheme: PinTheme(
              height: AppSize.s45,
              width: AppSize.s45,
              textStyle: StylesManager.medium18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  color: ColorManager.lightGray2)),
        );
      },
    );
  }
}
