import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/core/widgets/products_grid_view.dart';
import 'package:groceries_app/features/explore/presentation/cubit/explore_cubit.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key, required this.entity});
  final CategoryEntity entity;

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  bool isSnakbarShown = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExploreCubit, ExploreState>(
        listener: (context, state) {
          if (state is GetCategoryProductsError && !isSnakbarShown) {
            showSnackBar(context, text: state.error);
            isSnakbarShown = true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leading: const CustomBackButton(),
            centerTitle: true,
            title: Text(
              widget.entity.name,
              style: StylesManager.bold24,
            ),
          ),
          body: BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              final cubit = context.read<ExploreCubit>();
              if (state is GetCategoryProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetCategoryProductsError && cubit.products.isEmpty) {
                return CustomErrorWidget(error: state.error);
              }
              return ProductsGridView(
                products: cubit.products,
                onScroll: () async {
                  final currentPage = (cubit.products.length ~/ 8) + 1;
                  await cubit.getCategoryProducts(
                      page: currentPage, categoryId: widget.entity.categoryId);
                },
              );
            },
          ),
        ));
  }
}
