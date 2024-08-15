import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/core/widgets/products_grid_view.dart';
import 'package:groceries_app/features/search/presentation/cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        if (state is GetInitialProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetInitialProductsError) {
          return CustomErrorWidget(error: state.error);
        }
        return ProductsGridView(
            products: cubit.products,
            onScroll: () {
              cubit.getMoreProducts();
            });
      },
    );
  }
}
