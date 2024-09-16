import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/checkout/presentation/views/checkout_status_dialog_view.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_data_list_view.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_rich_text.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/order_failed_dialog_body.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          const CheckoutDataListView(),
          const CheckoutRichText(),
          CustomElevatedButtonWidget(
            verticalPadding: AppPadding.p16,
            child: const Text(
              AppStrings.placeOrder,
              style: StylesManager.semiBold18,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CheckoutStatusDialogView(
                      body: OrderFailedDialogBody());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
