import 'package:groceries_app/core/models/category_model.dart';
import 'package:groceries_app/core/models/products_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_details_response.g.dart';

@JsonSerializable(createToJson: false)
class ProductDetailsResponse {
  final String message;
  @JsonKey(name: 'data')
  final ProductDetailsModel? productDetails;

  ProductDetailsResponse({required this.message, required this.productDetails});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductDetailsModel extends ProductModel {
  final bool? isFavorite;
  final String? productDetails;
  final CategoryModel? category;
  @JsonKey(name: 'nutritions')
  final NutritionModel? nutrition;

  ProductDetailsModel(
      {required this.isFavorite,
      required this.productDetails,
      required this.nutrition,
      required this.category,
      required super.productId,
      required super.name,
      required super.quantityInStock,
      required super.description,
      required super.unitPrice,
      required super.rate,
      required super.imageUrl,
      required super.discountPercentage});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class NutritionModel {
  final int? nutritionId;
  final int? calories;
  final int? protein;
  final int? carbohydrates;

  NutritionModel(
      {required this.nutritionId,
      required this.calories,
      required this.protein,
      required this.carbohydrates});

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);
}
