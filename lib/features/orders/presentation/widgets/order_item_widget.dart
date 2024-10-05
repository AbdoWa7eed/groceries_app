import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_buttons_widget.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_item_header_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p16,
      ),
      child: Column(
        children: [
          OrderItemHeaderWidget(),
          SizedBox(height: AppSize.s20),
          OrderButtonsWidget()
        ],
      ),
    );
  }
}
