import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/core/network/products/product_api_service.dart';
import 'package:groceries_app/features/explore/data/api/explore_api_service.dart';
import 'package:groceries_app/features/explore/data/models/categories_response.dart';

abstract class ExploreDataSource {
  Future<CategoriesResponse> getCategories();

  Future<ProductsResponse> getCategoryProducts(ProductsRequestParams request);
}

class ExploreDataSourceImpl implements ExploreDataSource {
  final ExploreApiService _exploreApiService;
  final ProductApiService _productApiService;

  ExploreDataSourceImpl(this._exploreApiService, this._productApiService);

  @override
  Future<CategoriesResponse> getCategories() {
    return _exploreApiService.getCategories();
  }

  @override
  Future<ProductsResponse> getCategoryProducts(ProductsRequestParams request) {
    return _productApiService.getProducts(request);
  }
}
