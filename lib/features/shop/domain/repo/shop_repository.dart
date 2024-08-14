import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';

abstract class ShopRepository {
  ResultFuture<List<ProductEntity>> getBestSelling();
  ResultFuture<List<ProductEntity>> getExclusiveOffers();
  ResultFuture<List<BannerEntity>> getBanners();

}
