import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/widgets/places_drop_down_list.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final FloatingSearchBarController _searchBarController;

  @override
  initState() {
    super.initState();
    _searchBarController = FloatingSearchBarController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is GetPlaceDetailsSuccess) {
          _searchBarController.close();
        }
      },
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return FloatingSearchBar(
          backgroundColor: ColorManager.white,
          transitionDuration: const Duration(
              milliseconds: UiConstants.searchBarTransistionDuration),
          debounceDelay:
              const Duration(milliseconds: UiConstants.debounceDelay),
          builder: (context, transition) {
            return PlacesDropDownList(
              placesList:
                  state is GetSuggestedPlacesSuccess ? state.entities : [],
            );
          },
          actions: const [],
          margins: const EdgeInsetsDirectional.only(
              top: AppMargin.m40, start: AppMargin.m20, end: AppMargin.m20),
          automaticallyImplyBackButton: false,
          automaticallyImplyDrawerHamburger: false,
          leadingActions: _buildLeadingsList(),
          controller: _searchBarController,
          elevation: AppSize.s4,
          hint: AppStrings.searchLocation,
          scrollPadding: const EdgeInsets.only(top: AppSize.s16, bottom: 50),
          physics: const BouncingScrollPhysics(),
          onQueryChanged: (query) {
            cubit.getSuggestedPlaces(query);
          },
          onSubmitted: (query) {
            cubit.getSuggestedPlaces(query);
          },
          transition: CircularFloatingSearchBarTransition(),
        );
      },
    );
  }

  List<Widget> _buildLeadingsList() {
    return [
      FloatingSearchBarAction.icon(
        showIfClosed: true,
        onTap: () {
          _searchBarController.open();
        },
        icon: Icons.search,
      ),
      FloatingSearchBarAction.icon(
        showIfClosed: false,
        showIfOpened: true,
        icon: Icons.arrow_back_ios,
        onTap: () {
          _searchBarController.close();
        },
      ),
    ];
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }
}
