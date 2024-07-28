import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/location/data/models/place_details_model.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/data/models/suggested_place_model.dart';
import 'package:retrofit/retrofit.dart';

part 'location_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.googleMapUrl)
abstract class LocationApiService {
  factory LocationApiService(Dio dio, {String baseUrl}) = _LocationApiService;

  @GET("place/autocomplete/json")
  Future<SuggestedPlacesResponse> getSuggestedPlaces(
    @Queries() SuggestedPlaceRequestParams params,
  );

  @GET("place/details/json")
  Future<PlaceDetailsResponse> getPlaceDetails(
    @Queries() PlaceDetailsRequestParams params,
  );

  @GET("geocode/json")
  Future<PlaceReverseGeocodeResponse> getPlaceFromLatLng(
    @Queries() PlaceGeocodeRequestParams params,
  );
}
