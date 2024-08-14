import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/data/models/products_response.dart';
import 'package:groceries_app/core/network/products/product_api_service.dart';

abstract class ProductsDataSource {
  Future<ProductsResponse> getProducts(ProductsRequestParams request);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final ProductsApiService _productApiService;

  ProductsDataSourceImpl(this._productApiService);
  @override
  Future<ProductsResponse> getProducts(ProductsRequestParams request) {
    return _productApiService.getProducts(request);
  }
}
