import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/location/presentation/widgets/place_item_widget.dart';

class PlacesDropDownList extends StatelessWidget {
  const PlacesDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const PlaceItemWidget();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: AppSize.s12,
          );
        },
        itemCount: 5);
  }
}
