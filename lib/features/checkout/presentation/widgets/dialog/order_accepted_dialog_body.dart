import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/checkout_dialog_text_widget.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';

class OrderAcceptedDialogBody extends StatelessWidget {
  const OrderAcceptedDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          height: AppSize.s150,
          width: AppSize.s150,
          AssetsManager.success,
        ),
        const SizedBox(height: AppSize.s20),
        const CheckoutDialogTextWidget(
          title: AppStrings.orderPlacedTitle,
          subTitle: AppStrings.orderPlacedSubTitle,
        ),
        CustomElevatedButtonWidget(
          verticalPadding: AppPadding.p16,
          child: const Text(
            AppStrings.backToHome,
            style: StylesManager.semiBold18,
          ),
          onPressed: () {
            context.popAll();
            context.read<HomeController>().backToHome();
          },
        ),
      ],
    );
  }
}
