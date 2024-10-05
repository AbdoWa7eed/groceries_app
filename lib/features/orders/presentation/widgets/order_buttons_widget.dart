import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/orders/domain/entities/order_entity.dart';
import 'package:groceries_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:groceries_app/features/orders/presentation/widgets/order_action_button.dart';

class OrderButtonsWidget extends StatelessWidget {
  const OrderButtonsWidget({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final cubit = context.read<OrdersCubit>();
        if (state is CancelOrderLoading &&
            cubit.cancellingOrderId == order.orderId) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          height: AppSize.s45,
          child: Row(
            children: [
              Expanded(child: OrderActionButton(order: order)),
              Visibility(
                visible: !isDelivered,
                child: const SizedBox(width: AppSize.s20),
              ),
              Visibility(
                visible: !isDelivered,
                child: Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s8)),
                        side: const BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      onPressed: () {
                        cubit.cancelOrder(order.orderId);
                      },
                      child: Text(
                        AppStrings.cancel,
                        style: StylesManager.semiBold14
                            .copyWith(color: ColorManager.primary),
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool get isDelivered => order.status == OrderStatus.delivered;
}
