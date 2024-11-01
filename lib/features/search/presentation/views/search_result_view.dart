import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/add_item_to_cart_listener.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:groceries_app/features/search/presentation/widgets/search_view_app_bar.dart';
import 'package:groceries_app/features/search/presentation/widgets/search_view_body.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  bool _isSnackbarShown = false;
  @override
  Widget build(BuildContext context) {
    return AddItemToCartListener(
      child: BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is GetMoreProductsError && !_isSnackbarShown) {
            _isSnackbarShown = true;
            showSnackBar(context, text: state.error);
          }
        },
        child: const Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SearchViewAppBar(),
                Expanded(
                  child: SearchViewBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
