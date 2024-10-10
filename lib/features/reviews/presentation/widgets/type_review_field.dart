import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class TypeReviewFormField extends StatelessWidget {
  const TypeReviewFormField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: ValidationBuilder().required().build(),
      decoration: const InputDecoration(
        hintText: AppStrings.leaveReview,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGray),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGray),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
      ),
    );
  }
}
