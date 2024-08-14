import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_search_field.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:groceries_app/features/explore/presentation/widgets/categories_grid_view.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomSearchField(),
            BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                final cubit = context.read<ExploreCubit>();
                return CategoriesGridView(
                  categories: cubit.categories,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
