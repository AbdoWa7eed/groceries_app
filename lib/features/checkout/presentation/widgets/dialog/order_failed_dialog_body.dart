import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/checkout_dialog_text_widget.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';

class OrderFailedDialogBody extends StatelessWidget {
  const OrderFailedDialogBody({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          height: AppSize.s150,
          width: AppSize.s150,
          AssetsManager.groceriesBucket,
        ),
        const SizedBox(height: AppSize.s20),
        CheckoutDialogTextWidget(
          title: AppStrings.orderFailedTitle,
          subTitle: errorMessage,
        ),
        const SizedBox(height: AppSize.s30),
        CustomElevatedButtonWidget(
          verticalPadding: AppPadding.p16,
          child: const Text(
            AppStrings.tryAgain,
            style: StylesManager.semiBold18,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
            onPressed: () {
              context.popAll();
              context.read<HomeController>().backToHome();
            },
            child: const Text(AppStrings.backToHome))
      ],
    );
  }
}
