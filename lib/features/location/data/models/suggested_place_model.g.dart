// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestedPlacesResponse _$SuggestedPlacesResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestedPlacesResponse(
      (json['predictions'] as List<dynamic>?)
          ?.map((e) => SuggestedPlaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String,
    );

Map<String, dynamic> _$SuggestedPlacesResponseToJson(
        SuggestedPlacesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'predictions': instance.predictions,
    };

SuggestedPlaceModel _$SuggestedPlaceModelFromJson(Map<String, dynamic> json) =>
    SuggestedPlaceModel(
      json['description'] as String?,
      json['place_id'] as String?,
    );

Map<String, dynamic> _$SuggestedPlaceModelToJson(
        SuggestedPlaceModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.placeId,
    };
