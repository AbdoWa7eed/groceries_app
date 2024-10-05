import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_item_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const OrderItemWidget();
      },
      separatorBuilder: (context, index) {
        return const Divider(color: ColorManager.lightGray);
      },
      itemCount: 5,
    );
  }
}
