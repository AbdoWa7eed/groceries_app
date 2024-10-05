import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:groceries_app/features/orders/presentation/views/orders_listener.dart';
import 'package:groceries_app/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersListenerWidget(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.orders,
              style: StylesManager.semiBold26,
            ),
            leading: const CustomBackButton(),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  color: ColorManager.lightGray,
                )),
          ),
          body: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              final cubit = context.read<OrdersCubit>();
              if (state is GetOrdersLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetOrdersError) {
                return CustomErrorWidget(
                  error: state.error,
                  onTryAgain: () => cubit.getOrders(),
                );
              }

              return const OrdersViewBody();
            },
          )),
    );
  }
}
