import 'package:groceries_app/core/entities/category_entity.dart';
import 'package:groceries_app/core/entities/product_entity.dart';
import 'package:groceries_app/core/models/category_model.dart';
import 'package:groceries_app/core/models/products_response.dart';
import 'package:groceries_app/core/utils/extensions.dart';

extension ProductsMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId.orZero(),
      name: name.orEmpty(),
      quantityInStock: quantityInStock.orZero(),
      description: description.orEmpty(),
      unitPrice: unitPrice.orZero(),
      rate: rate.orZero(),
      imageUrl: imageUrl.orEmpty(),
      discountPercentage: discountPercentage.orZero(),
    );
  }
}

extension CategoryMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
        categoryId: categoryId.orZero(),
        name: name.orEmpty(),
        imageUrl: imageUrl.orEmpty());
  }
}
