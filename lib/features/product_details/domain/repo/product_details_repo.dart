import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRepository {
  ResultFuture<ProductDetailsEntity> getProductDetails(int productId);

  ResultFuture<String> addToFavorites(int productId);
}
