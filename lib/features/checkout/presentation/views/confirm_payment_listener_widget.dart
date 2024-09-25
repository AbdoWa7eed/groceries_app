import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/confirm_payment_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/views/checkout_status_dialog_view.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/order_accepted_dialog_body.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/dialog/order_failed_dialog_body.dart';

class ConfirmPaymentListener extends StatelessWidget {
  const ConfirmPaymentListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmPaymentCubit, ConfirmPaymentState>(
      listener: (context, state) {
        if (state is ConfirmPaymentLoading) {
          _showLoadingDialog(context);
        }

        if (state is ConfirmPaymentSuccess) {
          _showSuccessDialog(context);
        }

        if (state is ConfirmPaymentError) {
          _showErrorDialog(context);
        }
      },
      child: child,
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const CheckoutStatusDialogView(
            body: CircularProgressIndicator());
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    context.popAll();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const CheckoutStatusDialogView(
            body: OrderFailedDialogBody(
          errorMessage: AppStrings.paymentFailed,
        ));
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    context.popAll();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const CheckoutStatusDialogView(body: OrderAcceptedDialogBody());
      },
    );
  }
}
