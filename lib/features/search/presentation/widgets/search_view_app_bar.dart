import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_search_field.dart';
import 'package:groceries_app/features/search/presentation/cubit/search_cubit.dart';

class SearchViewAppBar extends StatefulWidget {
  const SearchViewAppBar({super.key});

  @override
  State<SearchViewAppBar> createState() => _SearchViewAppBarState();
}

class _SearchViewAppBarState extends State<SearchViewAppBar> {
  late final TextEditingController _searchController;

  @override
  initState() {
    _searchController = TextEditingController();
    _searchController.text = context.read<SearchCubit>().searchText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top:AppPadding.p12,
            bottom:AppPadding.p12,
            end: AppPadding.p20,

          ),
          child: Row(
            children: [
              const CustomBackButton(),
              Expanded(
                child: CustomSearchField(
                  controller: _searchController,
                  isSuffixIconVisible: true,
                  onSubmit: (value) {
                    cubit.getInitialProducts(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
