import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';

class ProductDetailsEntity extends ProductEntity {
  final bool isFavorite;
  final String productDetails;
  final CategoryEntity? category;
  final NutritionEntity? nutrition;

  const ProductDetailsEntity(
      {required super.productId,
      required super.name,
      required super.quantityInStock,
      required super.description,
      required super.unitPrice,
      required super.rate,
      required super.imageUrl,
      required super.discountPercentage,
      required this.productDetails,
      required this.isFavorite,
      required this.category,
      required this.nutrition});
}

class NutritionEntity {
  final int nutritionId;
  final int carb;
  final int protein;
  final int calories;

  NutritionEntity(
      {required this.nutritionId,
      required this.carb,
      required this.protein,
      required this.calories});
}
