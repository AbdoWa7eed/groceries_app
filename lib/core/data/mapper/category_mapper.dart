import 'package:groceries_app/core/data/models/category/category_model.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/utils/extensions.dart';

extension CategoryMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
        categoryId: categoryId.orZero(),
        name: name.orEmpty(),
        imageUrl: imageUrl.orEmpty());
  }
}
