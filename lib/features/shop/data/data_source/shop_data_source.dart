import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/features/shop/data/api/shop_api_service.dart';
import 'package:groceries_app/features/shop/data/models/banners_response.dart';

abstract class ShopDataSource {
  Future<ProductsResponse> getBestSelling();

  Future<ProductsResponse> getExclusiveOffers();

  Future<BannersResponse> getBanners();
}

class ShopDataSourceImpl implements ShopDataSource {
  final ShopApiService _shopApiService;

  ShopDataSourceImpl(this._shopApiService);

  @override
  Future<ProductsResponse> getBestSelling() {
    return _shopApiService.getBestSelling();
  }

  @override
  Future<ProductsResponse> getExclusiveOffers() {
    return _shopApiService.getExclusiveOffers();
  }


  @override
  Future<BannersResponse> getBanners() {
    return _shopApiService.getBanners();
  }
}
