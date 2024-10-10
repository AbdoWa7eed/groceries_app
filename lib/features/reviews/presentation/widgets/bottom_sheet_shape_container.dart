import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class BottomSheetShapeContainer extends StatelessWidget {
  const BottomSheetShapeContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.p12,
          horizontal: AppPadding.p18,
        ),
        decoration: const BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s20),
              topRight: Radius.circular(AppSize.s20),
            )),
        child: child,
      ),
    );
  }
}
