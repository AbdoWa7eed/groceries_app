import 'package:groceries_app/core/data/mapper/category_mapper.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/product_details/data/models/product_details_response.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';

extension ProductDetailsMapper on ProductDetailsModel {
  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      productId: productId.orZero(),
      name: name.orEmpty(),
      quantityInStock: quantityInStock.orZero(),
      description: description.orEmpty(),
      unitPrice: unitPrice.orZero(),
      rate: rate.orZero(),
      imageUrl: imageUrl.orEmpty(),
      discountPercentage: discountPercentage.orZero(),
      isFavorite: isFavorite ?? false,
      productDetails: productDetails.orEmpty(),
      category: category?.toEntity(),
      nutrition: nutrition?.toEntity(),
    );
  }
}

extension NutritionMapper on NutritionModel {
  NutritionEntity toEntity() {
    return NutritionEntity(
      nutritionId: nutritionId.orZero(),
      carb: carbohydrates.orZero(),
      protein: protein.orZero(),
      calories: calories.orZero(),
    );
  }
}
