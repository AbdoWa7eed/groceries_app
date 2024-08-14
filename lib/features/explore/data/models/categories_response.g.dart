// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CategoriesResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

CategoriesResponseData _$CategoriesResponseDataFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseData(
      itemsCount: (json['itemsCount'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
