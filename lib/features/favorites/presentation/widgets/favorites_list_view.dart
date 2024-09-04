import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:groceries_app/features/favorites/presentation/widgets/favorite_item_widget.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        return ListView.separated(
          padding: const EdgeInsetsDirectional.only(bottom: 70),
          itemBuilder: (context, index) =>
              FavoriteItemWidget(product: cubit.favorites[index]),
          separatorBuilder: (context, index) => const Divider(
            color: ColorManager.lightGray,
          ),
          itemCount: cubit.favorites.length,
        );
      },
    );
  }
}
