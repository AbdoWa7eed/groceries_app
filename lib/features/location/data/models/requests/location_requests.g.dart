// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SuggestedPlaceRequestParamsToJson(
        SuggestedPlaceRequestParams instance) =>
    <String, dynamic>{
      'key': instance.apiKey,
      'language': instance.language,
      'input': instance.place,
      'sessiontoken': instance.sessionToken,
    };

Map<String, dynamic> _$PlaceDetailsRequestParamsToJson(
        PlaceDetailsRequestParams instance) =>
    <String, dynamic>{
      'key': instance.apiKey,
      'language': instance.language,
      'place_id': instance.placeId,
      'sessiontoken': instance.sessionToken,
      'fields': instance.fields,
    };

Map<String, dynamic> _$PlaceGeocodeRequestParamsToJson(
        PlaceGeocodeRequestParams instance) =>
    <String, dynamic>{
      'key': instance.apiKey,
      'language': instance.language,
      'latlng': instance.latlng,
    };
