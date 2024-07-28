// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsResponse _$PlaceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceDetailsResponse(
      json['result'] == null
          ? null
          : PlaceDetailsDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
      json['status'] as String,
    );

Map<String, dynamic> _$PlaceDetailsResponseToJson(
        PlaceDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.placeDetails,
    };

PlaceReverseGeocodeResponse _$PlaceReverseGeocodeResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceReverseGeocodeResponse(
      (json['results'] as List<dynamic>?)
          ?.map(
              (e) => PlaceDetailsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String,
    );

Map<String, dynamic> _$PlaceReverseGeocodeResponseToJson(
        PlaceReverseGeocodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.places,
    };

PlaceDetailsDataModel _$PlaceDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    PlaceDetailsDataModel(
      json['place_id'] as String?,
      json['formatted_address'] as String?,
      json['geometry'] == null
          ? null
          : GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceDetailsDataModelToJson(
        PlaceDetailsDataModel instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'formatted_address': instance.address,
      'geometry': instance.geometry,
    };

GeometryModel _$GeometryModelFromJson(Map<String, dynamic> json) =>
    GeometryModel(
      json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryModelToJson(GeometryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      (json['lat'] as num?)?.toDouble(),
      (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
