import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';

class OrderImageWidget extends StatelessWidget {
  const OrderImageWidget({super.key, required this.orderItems});

  final List<OrderItemEntity> orderItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomNetworkImage(
          imageUrl: orderItems.first.product.imageUrl,
          width: AppSize.s80,
          height: AppSize.s80,
          fit: BoxFit.contain,
        ),
        if (orderItems.length > 1) ...[
          Positioned(
            bottom: -AppSize.s12,
            right: -AppSize.s12,
            child: CustomNetworkImage(
              imageUrl: orderItems[1].product.imageUrl,
              width: AppSize.s65,
              height: AppSize.s65,
              fit: BoxFit.contain,
            ),
          )
        ]
      ],
    );
  }
}
