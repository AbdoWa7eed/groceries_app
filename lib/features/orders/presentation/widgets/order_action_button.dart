import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_tracker_dialog.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)),
        ),
        onPressed: () => onPressed(context),
        child: Text(
          isTrackOrderButton ? AppStrings.trackOrder : AppStrings.pay,
          style: StylesManager.semiBold14,
        ));
  }

  void onPressed(BuildContext context) {
    if (isTrackOrderButton) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return OrderTrackingDialog(
            currentStatus: order.status,
          );
        },
      );
    } else {
      if (order.paymentLink == null) {
        showSnackBar(
          context,
          text: AppStrings.cannotPayOrder,
        );
        return;
      }
      context.push(Routes.confirmPayment,
          extra: PlaceOrderEntity(
            orderId: order.orderId,
            paymentLink: order.paymentLink,
          ));
    }
  }

  bool get isTrackOrderButton =>
      (order.paymentStatus == OrderPaymentStatus.paid ||
          order.paymentMethod == PaymentMethodsEnum.cash);
}
