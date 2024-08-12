import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        final isFavorite =
            cubit.isFavorite ?? cubit.productDetailsEntity.isFavorite;
        return IconButton(
          onPressed: () {
            if (isFavorite) {
              cubit.removeFromFavorites();
            } else {
              cubit.addToFavorites();
            }
          },
          icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
          color: isFavorite ? ColorManager.error : null,
        );
      },
    );
  }
}
