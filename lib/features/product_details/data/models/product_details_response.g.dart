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
      productDetails: json['productDetails'] as String?,
      nutrition: json['nutritions'] == null
          ? null
          : NutritionModel.fromJson(json['nutritions'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      quantityInStock: (json['quantityInStock'] as num?)?.toInt(),
      description: json['description'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
    );

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    NutritionModel(
      nutritionId: (json['nutritionId'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      protein: (json['protein'] as num?)?.toInt(),
      carbohydrates: (json['carbohydrates'] as num?)?.toInt(),
    );
