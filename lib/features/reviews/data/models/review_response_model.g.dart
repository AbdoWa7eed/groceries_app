// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    ReviewResponseModel(
      productId: (json['productId'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewDate: json['reviewDate'] == null
          ? null
          : DateTime.parse(json['reviewDate'] as String),
      reviewDescription: json['reviewDescription'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );
