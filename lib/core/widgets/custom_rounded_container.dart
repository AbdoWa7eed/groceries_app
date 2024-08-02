
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomRoundedContainer extends StatelessWidget {
  final Function()? onTab;
  final Widget child;
  final double size;
  final Color backgroundColor;
  final Color? borderColor;

  const CustomRoundedContainer({
    super.key,
    this.size = AppSize.s40,
    this.borderColor,
    required this.child,
    this.onTab,
    this.backgroundColor = ColorManager.primary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor ?? Colors.transparent
            ),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        height: size,
        width: size,
        child: Center(child: child),
      ),
    );
  }
}
