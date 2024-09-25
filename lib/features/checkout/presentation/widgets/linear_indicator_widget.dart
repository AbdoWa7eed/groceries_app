import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/confirm_payment_cubit.dart';

class LinearIndicatorWidget extends StatelessWidget {
  const LinearIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmPaymentCubit, ConfirmPaymentState>(
      buildWhen: (previous, current) => current is ChangeProgressState,
      builder: (context, state) {
        final cubit = context.read<ConfirmPaymentCubit>();
        if (cubit.progress < 1) {
          return LinearProgressIndicator(value: cubit.progress);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
