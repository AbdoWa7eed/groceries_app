import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/search_suffix_icon.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField(
      {super.key,
      this.controller,
      this.onSubmit,
      this.isSuffixIconVisible = false});

  final TextEditingController? controller;

  final Function(String value)? onSubmit;

  final bool isSuffixIconVisible;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          if (widget.onSubmit != null) {
            widget.onSubmit!(value);
          } else {
            _searchController.clear();
            context.push(Routes.searchResult, extra: value);
          }
        }
      },
      style: StylesManager.medium18,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxHeight: AppSize.s24,
          maxWidth: AppSize.s24,
        ),
        suffixIcon: SearchSuffixIcon(
          controller: widget.controller,
          isVisible: widget.isSuffixIconVisible,
        ),
        hintStyle: StylesManager.medium14,
        hintText: AppStrings.search,
        prefixIconConstraints:
            const BoxConstraints(minHeight: AppSize.s20, minWidth: AppSize.s20),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
              end: AppPadding.p8, start: AppPadding.p8),
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
