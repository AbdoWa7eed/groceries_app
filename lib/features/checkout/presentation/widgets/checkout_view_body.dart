import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_data_list_view.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_rich_text.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/place_order_button_widget.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          CheckoutDataListView(),
          CheckoutRichText(),
          PlaceOrderButtonWidget(),
        ],
      ),
    );
  }
}
