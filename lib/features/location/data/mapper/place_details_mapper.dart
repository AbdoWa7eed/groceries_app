import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/location/data/models/place_details_model.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';

extension PlaceDetailsMapper on PlaceDetailsDataModel {
  PlaceDetailsEntity toEntity() {
    return PlaceDetailsEntity(
      placeId: placeId.orEmpty(),
      address: address.orEmpty(),
      location: LocationEntity(
        latitude: geometry?.location?.lat ?? 0.0,
        longitude: geometry?.location?.lng ?? 0.0,
      ),
    );
  }
}

extension LocationMapper on LocationModel {
  
  LocationEntity toEntity() {
    return LocationEntity(
      latitude: lat.orZero(),
      longitude: lng.orZero(),
    );
  }
}
