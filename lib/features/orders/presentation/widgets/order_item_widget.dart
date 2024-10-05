import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_buttons_widget.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_item_header_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p16,
      ),
      child: Column(
        children: [
          OrderItemHeaderWidget(order: order),
          const SizedBox(height: AppSize.s20),
          OrderButtonsWidget(order: order),
        ],
      ),
    );
  }
}
