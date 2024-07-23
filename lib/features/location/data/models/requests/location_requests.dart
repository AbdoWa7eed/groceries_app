import 'package:json_annotation/json_annotation.dart';

part 'location_requests.g.dart';

class LocationRequest {
  @JsonKey()
  String? apiKey;

  LocationRequest({required this.apiKey});
}

@JsonSerializable()
class SuggestedPlaceRequestParams extends LocationRequest {
  @JsonKey(name: 'input')
  final String place;
  @JsonKey(name: 'sessiontoken')
  final String sessionToken;

  SuggestedPlaceRequestParams({
    required this.place,
    required super.apiKey,
    required this.sessionToken,
  });

  Map<String, dynamic> toJson() => _$SuggestedPlaceRequestParamsToJson(this);

  copyWith({
    String? place,
    String? sessionToken,
    String? apiKey,
  }) {
    return SuggestedPlaceRequestParams(
        apiKey: apiKey ?? this.apiKey,
        place: place ?? this.place,
        sessionToken: sessionToken ?? this.sessionToken);
  }
}

@JsonSerializable()
class PlaceDetailsRequestParams extends LocationRequest {
  @JsonKey(name: 'place_id')
  final String placeId;
  @JsonKey(name: 'fields')
  final String fields;
  @JsonKey(name: 'sessiontoken')
  final String sessionToken;

  PlaceDetailsRequestParams({
    required this.placeId,
    required super.apiKey,
    required this.fields,
    required this.sessionToken,
  });

  Map<String, dynamic> toJson() => _$PlaceDetailsRequestParamsToJson(this);

  copyWith({
    String? apiKey,
    String? fields,
    String? sessionToken,
    String? placeId,
  }) {
    return PlaceDetailsRequestParams(
      apiKey: apiKey ?? this.apiKey,
      fields: fields ?? this.fields,
      sessionToken: sessionToken ?? this.sessionToken,
      placeId: placeId ?? this.placeId,
    );
  }
}

@JsonSerializable()
class PlaceGeocodeRequestParams extends LocationRequest {
  @JsonKey(name: 'latlng')
  final String latlng;

  PlaceGeocodeRequestParams({
    required this.latlng,
    required super.apiKey,
  });

  Map<String, dynamic> toJson() => _$PlaceGeocodeRequestParamsToJson(this);

  copyWith({
    String? apiKey,
    String? latlng,
  }) {
    return PlaceGeocodeRequestParams(
      apiKey: apiKey ?? this.apiKey,
      latlng: latlng ?? this.latlng,
    );
  }
}
