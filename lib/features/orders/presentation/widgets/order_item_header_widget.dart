import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_image_widget.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_info_widget.dart';

class OrderItemHeaderWidget extends StatelessWidget {
  const OrderItemHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        OrderImageWidget(),
        SizedBox(width: AppSize.s20),
        Expanded(child: OrderInfoWidget()),
      ],
    );
  }
}
