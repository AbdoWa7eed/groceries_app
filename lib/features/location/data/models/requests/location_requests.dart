import 'package:json_annotation/json_annotation.dart';

part 'location_requests.g.dart';

class LocationRequest {
  @JsonKey(name: 'key')
  String? apiKey;
  @JsonKey(name: 'language')
  String? _language;

  String get language => _language ?? 'en';
  LocationRequest({this.apiKey});
}

@JsonSerializable(createFactory: false)
class SuggestedPlaceRequestParams extends LocationRequest {
  @JsonKey(name: 'input')
  final String place;
  @JsonKey(name: 'sessiontoken')
  final String sessionToken;

  SuggestedPlaceRequestParams({
    required this.place,
    super.apiKey,
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

@JsonSerializable(createFactory: false)
class PlaceDetailsRequestParams extends LocationRequest {
  @JsonKey(name: 'place_id')
  final String placeId;
  @JsonKey(name: 'fields')
  String? _fields;
  @JsonKey(name: 'sessiontoken')
  final String sessionToken;

  String get fields => _fields ?? 'place_id,formatted_address,geometry';

  PlaceDetailsRequestParams({
    required this.placeId,
    super.apiKey,
    required this.sessionToken,
  });

  Map<String, dynamic> toJson() => _$PlaceDetailsRequestParamsToJson(this);

  copyWith({
    String? apiKey,
    String? sessionToken,
    String? placeId,
  }) {
    return PlaceDetailsRequestParams(
      apiKey: apiKey ?? this.apiKey,
      sessionToken: sessionToken ?? this.sessionToken,
      placeId: placeId ?? this.placeId,
    );
  }
}

@JsonSerializable(createFactory: false)
class PlaceGeocodeRequestParams extends LocationRequest {
  @JsonKey(name: 'latlng')
  final String latlng;

  PlaceGeocodeRequestParams({
    required this.latlng,
    super.apiKey,
  });

  Map<String, dynamic> toJson() => _$PlaceGeocodeRequestParamsToJson(this);

  PlaceGeocodeRequestParams copyWith({
    String? apiKey,
    String? latlng,
  }) {
    return PlaceGeocodeRequestParams(
      apiKey: apiKey ?? this.apiKey,
      latlng: latlng ?? this.latlng,
    );
  }
}
