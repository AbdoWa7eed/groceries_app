

import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/features/shop/data/models/banners_response.dart';
import 'package:retrofit/retrofit.dart';
part 'shop_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ShopApiService {

  factory ShopApiService(Dio dio , {String? baseUrl}) = _ShopApiService;

  @GET('exclusive_offers')
  Future<ProductsResponse> getExclusiveOffers();

  @GET('best_selling')
  Future<ProductsResponse> getBestSelling();

  @GET('banners')
  Future<BannersResponse> getBanners();

}