import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';

abstract class FavoriteRepository {
  ResultFuture<String> addFavorite(int productId);
  ResultFuture<String> removeFavorite(int productId);
  ResultFuture<List<ProductEntity>> getFavorites();
}
