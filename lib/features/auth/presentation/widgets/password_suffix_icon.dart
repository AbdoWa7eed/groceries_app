import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class PasswordSuffixIcon extends StatefulWidget {
  const PasswordSuffixIcon({super.key, required this.onTap});
  final Function(bool value) onTap;
  @override
  State<PasswordSuffixIcon> createState() => _PasswordSuffixIconState();
}

class _PasswordSuffixIconState extends State<PasswordSuffixIcon> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
        widget.onTap(_obscureText);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: _obscureText
            ? const Icon(
                Icons.visibility_off_outlined,
                color: ColorManager.gray,
              )
            : const Icon(
                Icons.visibility_outlined,
                color: ColorManager.primary,
              ),
      ),
    );
  }
}
