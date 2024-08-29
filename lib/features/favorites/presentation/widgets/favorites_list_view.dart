import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/favorites/presentation/widgets/favorite_item_widget.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(bottom: 70),
      itemBuilder: (context, index) => const FavoriteItemWidget(),
      separatorBuilder: (context, index) => const Divider(
        color: ColorManager.lightGray,
      ),
      itemCount: 10,
    );
  }
}
