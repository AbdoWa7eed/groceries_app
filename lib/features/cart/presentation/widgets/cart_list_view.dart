import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_widget.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(bottom: 70),
      itemBuilder: (context, index) => const CartItemWidget(),
      separatorBuilder: (context, index) => const Divider(
        color: ColorManager.lightGray,
      ),
      itemCount: 10,
    );
  }
}
