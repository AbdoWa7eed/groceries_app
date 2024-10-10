// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_view_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleReviewResponse _$SingleReviewResponseFromJson(
        Map<String, dynamic> json) =>
    SingleReviewResponse(
      message: json['message'] as String,
      review: json['data'] == null
          ? null
          : ReviewResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );
