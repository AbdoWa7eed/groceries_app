// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      message: json['message'] as String,
      productDetails: json['data'] == null
          ? null
          : ProductDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      isFavorite: json['isFavorite'] as bool?,
      nutrition: json['nutrition'] == null
          ? null
          : NutritionModel.fromJson(json['nutrition'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    NutritionModel(
      nutritionId: (json['nutritionId'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      protein: (json['protein'] as num?)?.toInt(),
      carbs: (json['carbs'] as num?)?.toInt(),
    );
