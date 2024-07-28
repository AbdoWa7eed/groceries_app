import 'package:groceries_app/features/location/data/models/location_reponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_details_model.g.dart';

@JsonSerializable()
class PlaceDetailsResponse extends LocationResponse {
  @JsonKey(name: "result")
  final PlaceDetailsDataModel? placeDetails;

  PlaceDetailsResponse(this.placeDetails, super.status);

  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsResponseToJson(this);
}



@JsonSerializable()
class PlaceReverseGeocodeResponse extends LocationResponse {
  @JsonKey(name: "results")
  final List<PlaceDetailsDataModel>? places;

  PlaceReverseGeocodeResponse(this.places, super.status);

  factory PlaceReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceReverseGeocodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceReverseGeocodeResponseToJson(this);   
}

@JsonSerializable()
class PlaceDetailsDataModel {
  @JsonKey(name: "place_id")
  final String? placeId;
  @JsonKey(name: "formatted_address")
  final String? address;
  @JsonKey(name: "geometry")
  final GeometryModel? geometry;
  PlaceDetailsDataModel(this.placeId, this.address, this.geometry);

  factory PlaceDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsDataModelToJson(this);
}
@JsonSerializable()
class GeometryModel {
  @JsonKey(name: "location")
  final LocationModel? location;

  GeometryModel(this.location);

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;

  LocationModel(this.lat, this.lng);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
