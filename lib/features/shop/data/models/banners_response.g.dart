// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : BannersResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

BannersResponseData _$BannersResponseDataFromJson(Map<String, dynamic> json) =>
    BannersResponseData(
      itemCount: (json['itemCount'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      id: (json['id'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );
