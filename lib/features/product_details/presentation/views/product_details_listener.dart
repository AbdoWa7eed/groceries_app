import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';

class ProductDetailsListener extends StatelessWidget {
  const ProductDetailsListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is UpdateFavoriteSuccess) {
          showSnackBar(context,
              text: state.message, color: ColorManager.primary);
        }

        if (state is UpdateFavoriteError) {
          showSnackBar(context, text: state.message);
        }
      },
      child: child,
    );
  }
}
