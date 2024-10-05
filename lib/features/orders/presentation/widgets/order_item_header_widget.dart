import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_image_widget.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_info_widget.dart';

class OrderItemHeaderWidget extends StatelessWidget {
  const OrderItemHeaderWidget({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderImageWidget(orderItems: order.orderItems),
        const SizedBox(width: AppSize.s20),
        Expanded(child: OrderInfoWidget(order: order)),
      ],
    );
  }
}
