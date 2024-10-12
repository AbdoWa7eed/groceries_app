import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/add_item_to_cart_listener.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
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
  bool isSnackbarShown = false;
  @override
  Widget build(BuildContext context) {
    return AddItemToCartListener(
      child: BlocListener<ExploreCubit, ExploreState>(
          listener: (context, state) {
            if (state is GetMoreCategoryProductsError && !isSnackbarShown) {
              showSnackBar(context, text: state.error);
              isSnackbarShown = true;
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
                if (state is GetCategoryProductsError &&
                    cubit.products.isEmpty) {
                  return CustomErrorWidget(error: state.error);
                }
                return ProductsGridView(
                  products: cubit.products,
                  onScroll: () async {
                    cubit.getMoreProducts(categoryId: widget.entity.categoryId);
                  },
                );
              },
            ),
          )),
    );
  }
}
