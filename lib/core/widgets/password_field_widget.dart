import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';
import 'package:groceries_app/core/widgets/custom_form_field.dart';
import 'package:groceries_app/core/widgets/password_suffix_icon.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      validator: widget.validator ??
          ValidationBuilder()
              .regExp(UiConstants.passwordRegex,
                  AppStrings.passwordValidationMessage)
              .build(),
      obscureText: _isPasswordShown,
      labelText: widget.labelText,
      suffix: PasswordSuffixIcon(
        onTap: (value) {
          setState(() {
            _isPasswordShown = value;
          });
        },
      ),
    );
  }
}
