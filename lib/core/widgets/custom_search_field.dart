import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.controller, this.onSubmit});

  final TextEditingController? controller;

  final Function(String value)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      style: StylesManager.medium18,
      decoration: InputDecoration(
        hintStyle: StylesManager.medium14,
        hintText: AppStrings.search,
        prefixIconConstraints:
            const BoxConstraints(minHeight: AppSize.s20, minWidth: AppSize.s20),
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(right: AppPadding.p8, left: AppPadding.p8),
          child: SvgPicture.asset(
            AssetsManager.search,
          ),
        ),
        fillColor: ColorManager.lightGray2,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
