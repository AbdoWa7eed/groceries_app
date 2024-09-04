import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:groceries_app/features/favorites/presentation/views/favorite_listener_widget.dart';
import 'package:groceries_app/features/favorites/presentation/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteListenerWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.favorite,
            style: StylesManager.semiBold26,
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                color: ColorManager.lightGray,
              )),
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteError) {
              return CustomErrorWidget(error: state.message);
            }
            return const FavoritesViewBody();
          },
        ),
      ),
    );
  }
}
