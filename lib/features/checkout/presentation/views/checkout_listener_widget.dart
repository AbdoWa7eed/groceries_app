import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/views/checkout_status_dialog_view.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/order_accepted_dialog_body.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/order_failed_dialog_body.dart';

class CheckoutListenerWidget extends StatelessWidget {
  const CheckoutListenerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          if (state.placeOrderEntity.paymentLink != null) {
            context.push(Routes.confirmPayment, extra: state.placeOrderEntity);
          }else{
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const CheckoutStatusDialogView(
                    body: OrderAcceptedDialogBody());
              },
            );
          }

        }
        if (state is PlaceOrderError) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CheckoutStatusDialogView(
                  body: OrderFailedDialogBody(
                errorMessage: state.message,
              ));
            },
          );
        }
      },
      child: child,
    );
  }
}
