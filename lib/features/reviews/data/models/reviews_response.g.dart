// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ReviewsResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

ReviewsResponseData _$ReviewsResponseDataFromJson(Map<String, dynamic> json) =>
    ReviewsResponseData(
      reviewsCount: (json['itemCount'] as num?)?.toInt(),
      reviews: (json['items'] as List<dynamic>?)
          ?.map((e) => ReviewResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
