import 'package:flutter_config/flutter_config.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/features/location/data/api/location_api_service.dart';
import 'package:groceries_app/features/location/data/models/place_details_model.dart';
import 'package:groceries_app/features/location/data/models/requests/location_requests.dart';
import 'package:groceries_app/features/location/data/models/suggested_place_model.dart';

abstract class LocationDataSource {
  Future<SuggestedPlacesResponse> getSuggestedPlaces(
      SuggestedPlaceRequestParams suggestedPlaceRequest);

  Future<PlaceDetailsResponse> getPlaceDetails(
      PlaceDetailsRequestParams placeDetailsRequest);

  Future<PlaceReverseGeocodeResponse> getPlaceFromLatLng(
      PlaceGeocodeRequestParams placeGeocodeRequest);
}

class LocationDataSourceImpl implements LocationDataSource {
  final LocationApiService apiService;

  LocationDataSourceImpl(this.apiService);

  @override
  Future<SuggestedPlacesResponse> getSuggestedPlaces(
      SuggestedPlaceRequestParams suggestedPlaceRequest) async {
    return await apiService
        .getSuggestedPlaces(suggestedPlaceRequest.copyWith(apiKey: _key));
  }

  String get _key => FlutterConfig.get(ApiConstants.googleMapKey);

  @override
  Future<PlaceDetailsResponse> getPlaceDetails(
      PlaceDetailsRequestParams placeDetailsRequest) {
    return apiService
        .getPlaceDetails(placeDetailsRequest.copyWith(apiKey: _key));
  }

  @override
  Future<PlaceReverseGeocodeResponse> getPlaceFromLatLng(
      PlaceGeocodeRequestParams placeGeocodeRequest) {
    return apiService
        .getPlaceFromLatLng(placeGeocodeRequest.copyWith(apiKey: _key));
  }
}
