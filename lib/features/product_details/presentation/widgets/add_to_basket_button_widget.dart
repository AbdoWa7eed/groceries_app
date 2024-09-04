import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_button_widget.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';

class AddToBasketButtonWidget extends StatelessWidget {
  const AddToBasketButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
      child: Text(AppStrings.addToBasket,
          style: StylesManager.semiBold18.copyWith(color: ColorManager.white)),
      onPressed: () {
        final cubit = context.read<ProductDetailsCubit>();
        context.read<CartCubit>().addToCart(
            cubit.productDetailsEntity.productId,
            quantity: cubit.quantity);
      },
    );
  }
}
