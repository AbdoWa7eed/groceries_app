import 'package:flutter/material.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:provider/provider.dart';

class CheckoutStatusDialogView extends StatelessWidget {
  const CheckoutStatusDialogView({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>.value(
      value: getIt(),
      child: PopScope(
        canPop: false,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
          backgroundColor: ColorManager.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p20),
            child: body,
          ),
        ),
      ),
    );
  }
}
