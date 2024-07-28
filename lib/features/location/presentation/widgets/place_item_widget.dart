import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';

class PlaceItemWidget extends StatelessWidget {
  const PlaceItemWidget({super.key, required this.entity});
  final SuggestedPlaceEntity entity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return InkWell(
            onTap: () {
              cubit.getPlaceDetails(entity.placeId);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                color: ColorManager.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16, vertical: AppPadding.p8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: AppSize.s20,
                      backgroundColor: ColorManager.primaryWith10Opacity,
                      child: Icon(Icons.place, color: ColorManager.primary),
                    ),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: StylesManager.semiBold18
                                .copyWith(color: ColorManager.dark),
                          ),
                          const SizedBox(
                            height: AppSize.s4,
                          ),
                          Text(
                            address,
                            style: StylesManager.regular16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  String get title => entity.description.split(',').first;

  String get address =>
      entity.description.substring(entity.description.indexOf(',') + 1).trim();
}
