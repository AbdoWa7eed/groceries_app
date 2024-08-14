import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:groceries_app/features/explore/presentation/widgets/categories_shimmer_loading.dart';
import 'package:groceries_app/features/explore/presentation/widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.findProducts,
          style: StylesManager.semiBold26,
        ),
      ),
      body: BlocBuilder<ExploreCubit, ExploreState>(builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return const CategoriesShimmerLoading();
        }
        if (state is GetCategoriesError) {
          return CustomErrorWidget(error: state.error);
        }
        return const ExploreViewBody();
      }),
    );
  }
}
