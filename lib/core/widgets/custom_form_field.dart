import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      this.suffix,
      this.controller,
      this.validator,
      this.keyboardType});

  final String labelText;
  final bool obscureText;
  final Widget? suffix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: ColorManager.primary,
      controller: controller,
      obscureText: obscureText,
      style: StylesManager.medium18,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIconConstraints: const BoxConstraints(maxHeight: AppSize.s14),
        suffixIcon: suffix,
      ),
    );
  }
}
