import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/core/network/favorites/favorite_api_service.dart';

abstract class FavoriteDataSource {
  Future<BaseResponse> addFavorite(int productId);
  Future<BaseResponse> removeFavorite(int productId);
  Future<ProductsResponse> getFavorites();
}

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final FavoriteApiService _apiService;

  FavoriteDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse> addFavorite(int productId) {
    
    return _apiService.addFavorite(productId);
  }

  @override
  Future<ProductsResponse> getFavorites() {
    return _apiService.getFavorites();
  }

  @override
  Future<BaseResponse> removeFavorite(int productId) {
    return _apiService.deleteFavorite(productId);
  }
}
