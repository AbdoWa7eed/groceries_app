import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:pinput/pinput.dart';

class CodeInputWidget extends StatelessWidget {
  const CodeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
          height: AppSize.s45,
          width: AppSize.s45,
          textStyle: StylesManager.medium18,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: ColorManager.lightGray2)),
    );
  }
}
