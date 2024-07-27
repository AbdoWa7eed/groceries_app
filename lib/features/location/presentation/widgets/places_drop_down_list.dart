import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';
import 'package:groceries_app/features/location/presentation/widgets/place_item_widget.dart';

class PlacesDropDownList extends StatelessWidget {
  const PlacesDropDownList({super.key, required this.placesList});

  final List<SuggestedPlaceEntity> placesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PlaceItemWidget(
            entity: placesList[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: AppSize.s12,
          );
        },
        itemCount: placesList.length);
  }
}
