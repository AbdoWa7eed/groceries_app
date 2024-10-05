import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: const OrdersViewBody());
  }
}
