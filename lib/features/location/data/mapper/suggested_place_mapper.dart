import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/location/data/models/suggested_place_model.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';

extension SuggestedPlaceMapper on SuggestedPlaceModel {
  SuggestedPlaceEntity toEntity() {
    return SuggestedPlaceEntity(
      description: description.orEmpty(),
      placeId: placeId.orEmpty(),
    );
  }
}
