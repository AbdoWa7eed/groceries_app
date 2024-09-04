import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';

class FavoriteListenerWidget extends StatelessWidget {
  const FavoriteListenerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is RemoveFromFavoriteSuccess ||
            state is AddAllToCartSuccess) {
          showSnackBar(
            context,
            text: (state as dynamic).message,
            color: ColorManager.primary,
          );
        }
        if (state is RemoveFromFavoriteError || state is AddAllToCartError) {
          showSnackBar(
            context,
            text: (state as dynamic).message,
          );
        }
      },
      child: child,
    );
  }
}
