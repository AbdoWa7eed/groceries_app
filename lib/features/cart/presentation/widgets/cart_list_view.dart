import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_item_widget.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        return ListView.separated(
          padding: const EdgeInsetsDirectional.only(bottom: 70),
          itemBuilder: (context, index) => CartItemWidget(
            cartItem: cubit.cart.cartItems[index],
          ),
          separatorBuilder: (context, index) => const Divider(
            color: ColorManager.lightGray,
          ),
          itemCount: cubit.cart.cartItems.length,
        );
      },
    );
  }
}
