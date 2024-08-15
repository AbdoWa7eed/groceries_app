import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:groceries_app/features/search/presentation/widgets/search_view_app_bar.dart';
import 'package:groceries_app/features/search/presentation/widgets/search_view_body.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  bool _isSnakbarShown = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is GetMoreProductsError && !_isSnakbarShown) {
          _isSnakbarShown = true;
          showSnackBar(context, text: state.error);
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchViewAppBar(),
              Expanded(child:SearchViewBody(),),
            ],
          ),
        ),
      ),
    );
  }
}
