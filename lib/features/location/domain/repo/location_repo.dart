import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/domain/entity/place_details_entity.dart';
import 'package:groceries_app/features/location/domain/entity/suggested_place_entity.dart';

abstract class LocationRepository {
  ResultFuture<List<SuggestedPlaceEntity>> getSuggestedPlaces(
    SuggestedPlaceRequestParams suggestedPlacesRequest,
  );
  ResultFuture<PlaceDetailsEntity> getPlaceDetails(
    PlaceDetailsRequestParams placeDetailsRequest,
  );
  ResultFuture<PlaceDetailsEntity> getPlaceFromCoordinates(
    PlaceGeocodeRequestParams placeGeocodeRequest,
  );

   ResultFuture<void> updateUserAddress(
    String address,
  );
  
}
