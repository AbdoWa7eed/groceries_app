import 'package:groceries_app/features/location/data/models/location_reponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'suggested_place_model.g.dart';

@JsonSerializable()
class SuggestedPlacesResponse extends LocationResponse {
  @JsonKey(name: "predictions")
  final List<SuggestedPlaceModel>? predictions;

  SuggestedPlacesResponse(this.predictions, super.status);

  factory SuggestedPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestedPlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestedPlacesResponseToJson(this);
}

@JsonSerializable()
class SuggestedPlaceModel {
  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "place_id")
  final String? placeId;

  SuggestedPlaceModel(this.description, this.placeId);

  factory SuggestedPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestedPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestedPlaceModelToJson(this);
}
