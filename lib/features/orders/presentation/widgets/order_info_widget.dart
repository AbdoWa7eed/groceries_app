import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order.status.name.capitalizeFirstLetter,
              style: StylesManager.bold16,
            ),
            Text(
              '#${order.orderId}',
              style: StylesManager.regular14,
            ),
          ],
        ),
        const SizedBox(height: AppSize.s20),
        Row(
          children: [
            Text(
              '\$${order.totalPrice}',
              style: StylesManager.bold16,
            ),
            const SizedBox(
              height: AppSize.s16,
              child: VerticalDivider(
                color: ColorManager.lightGray,
                thickness: 1,
              ),
            ),
            Text(
              '${order.orderItems.length} Items',
              style: StylesManager.regular14,
            ),
          ],
        ),
      ],
    );
  }
}
