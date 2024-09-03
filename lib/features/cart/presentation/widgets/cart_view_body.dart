import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/empty_screen_widget.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:groceries_app/features/cart/presentation/widgets/checkout_button_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (context.read<CartCubit>().cart.cartItems.isEmpty) {
          return CustomEmptyScreen(
            text: AppStrings.emptyCart,
            onTryAgain: () {
              context.read<CartCubit>().getCart();
            },
          );
        }
        return RefreshIndicator(
          displacement: 1,
          onRefresh: () async {
            context.read<CartCubit>().getCart();
          },
          child: const Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CartListView(),
                CheckoutButtonWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
