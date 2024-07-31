import 'package:groceries_app/core/entities/product_entity.dart';
import 'package:groceries_app/core/models/product_request_params.dart';
import 'package:groceries_app/core/network/api_result.dart';

abstract class ShopRepository {
  ResultFuture<List<ProductEntity>> getBestSelling();
  ResultFuture<List<ProductEntity>> getExclusiveOffers();
  ResultFuture<List<ProductEntity>> getGroceries(ProductsRequestParams request);
}
