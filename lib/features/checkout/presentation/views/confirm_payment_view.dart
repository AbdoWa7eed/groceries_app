import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/confirm_payment_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/views/confirm_payment_listener_widget.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/confirm_payment_view_body.dart';

class ConfirmPaymentView extends StatelessWidget {
  const ConfirmPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmPaymentListener(
      child: BlocBuilder<ConfirmPaymentCubit, ConfirmPaymentState>(
        buildWhen: (previous, current) => current is ChangeUrlState,
        builder: (context, state) {
          final cubit = context.read<ConfirmPaymentCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(AppStrings.confirmPayment,
                  style: StylesManager.semiBold26),
              leading: cubit.getUrlType() != PaymentUrlType.redirect
                  ? const CustomBackButton()
                  : null,
            ),
            body: const ConfirmPaymentViewBody(),
          );
        },
      ),
    );
  }
}
