import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;
  final bool isLoading;
  const CustomElevatedButtonWidget(
      {super.key,
      required this.child,
      this.onPressed,
      this.width = double.infinity,
      this.height = AppSize.s65,
      this.verticalPadding = AppPadding.p40,
      this.isLoading = false,
      this.horizontalPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: SizedBox(
        width: width,
        height: height,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: onPressed,
                child: child,
              ),
      ),
    );
  }
}
