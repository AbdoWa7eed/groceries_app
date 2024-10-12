import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/orders/presentation/cubit/orders_cubit.dart';

class OrdersListenerWidget extends StatelessWidget {
  const OrdersListenerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersSuccess<String>) {
          showSnackBar(context,
              text: state.data.toString(), color: ColorManager.primary);
        }
        if (state is CancelOrdersError) {
          showSnackBar(context, text: state.error);
        }
      },
      child: child,
    );
  }
}
