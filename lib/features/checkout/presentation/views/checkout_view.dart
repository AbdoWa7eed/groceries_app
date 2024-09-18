import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/checkout/presentation/views/checkout_listener_widget.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_view_header.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutListenerWidget(
      child: Container(
        decoration: const BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s30),
              topLeft: Radius.circular(AppSize.s30),
            )),
        child: const Column(
          children: [
            CheckoutViewHeader(),
            Expanded(child: CheckoutViewBody()),
          ],
        ),
      ),
    );
  }
}
