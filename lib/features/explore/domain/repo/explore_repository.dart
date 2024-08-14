import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';

abstract class ExploreRepository {
  ResultFuture<List<CategoryEntity>> getCategories();

  ResultFuture<List<ProductEntity>> getCategoryProducts(
      ProductsRequestParams params);
}
