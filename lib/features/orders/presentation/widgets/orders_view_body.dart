import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/widgets/empty_screen_widget.dart';
import 'package:groceries_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_item_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      final cubit = context.read<OrdersCubit>();
      if (cubit.orders.isEmpty) {
        return const CustomEmptyScreen(
          text: AppStrings.noOrdersYet,
        );
      }
      return RefreshIndicator(
        displacement: 1,
        onRefresh: () async => cubit.getOrders(),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return OrderItemWidget(
              order: cubit.orders[index],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(color: ColorManager.lightGray);
          },
          itemCount: cubit.orders.length,
        ),
      );
    });
  }
}
