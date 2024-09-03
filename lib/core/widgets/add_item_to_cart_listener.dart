import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';

class AddItemToCartListener extends StatelessWidget {
  const AddItemToCartListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          showSnackBar(context,
              text: state.message, color: ColorManager.primary);
        }
        if (state is AddToCartError) {
          showSnackBar(context, text: state.message);
        }
      },
      child: child,
    );
  }
}
