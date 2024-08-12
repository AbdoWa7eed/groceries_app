import 'package:dio/dio.dart';
import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:groceries_app/core/network/api_constants.dart';
part 'favorite_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FavoriteApiService {
  factory FavoriteApiService(Dio dio , {String? baseUrl}) = _FavoriteApiService;

  @POST('favorites')
  Future<BaseResponse> addFavorite(
    @Field() int productId,
  );

  @DELETE('favorites')
  Future<BaseResponse> deleteFavorite(
    @Field() int productId,
  );

  @DELETE('favorites')
  Future<ProductsResponse> getFavorites();
}
