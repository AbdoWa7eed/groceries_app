// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestedPlaceRequestParams _$SuggestedPlaceRequestParamsFromJson(
        Map<String, dynamic> json) =>
    SuggestedPlaceRequestParams(
      place: json['input'] as String,
      apiKey: json['apiKey'] as String?,
      sessionToken: json['sessiontoken'] as String,
    );

Map<String, dynamic> _$SuggestedPlaceRequestParamsToJson(
        SuggestedPlaceRequestParams instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'input': instance.place,
      'sessiontoken': instance.sessionToken,
    };

PlaceDetailsRequestParams _$PlaceDetailsRequestParamsFromJson(
        Map<String, dynamic> json) =>
    PlaceDetailsRequestParams(
      placeId: json['place_id'] as String,
      apiKey: json['apiKey'] as String?,
      fields: json['fields'] as String,
      sessionToken: json['sessiontoken'] as String,
    );

Map<String, dynamic> _$PlaceDetailsRequestParamsToJson(
        PlaceDetailsRequestParams instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'place_id': instance.placeId,
      'fields': instance.fields,
      'sessiontoken': instance.sessionToken,
    };

PlaceGeocodeRequestParams _$PlaceGeocodeRequestParamsFromJson(
        Map<String, dynamic> json) =>
    PlaceGeocodeRequestParams(
      latlng: json['latlng'] as String,
      apiKey: json['apiKey'] as String?,
    );

Map<String, dynamic> _$PlaceGeocodeRequestParamsToJson(
        PlaceGeocodeRequestParams instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'latlng': instance.latlng,
    };
