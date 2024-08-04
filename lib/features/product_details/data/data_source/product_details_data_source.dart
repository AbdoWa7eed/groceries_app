import 'package:groceries_app/core/models/base_response.dart';
import 'package:groceries_app/features/product_details/data/api/product_details_api_service.dart';
import 'package:groceries_app/features/product_details/data/models/product_details_response.dart';

abstract class ProductDetailsDataSource {
  Future<ProductDetailsResponse> getProductDetails(String productId);

  Future<BaseResponse> addProductToFavorites(int productId);
}

class ProductDetailsDataSourceImpl implements ProductDetailsDataSource {
  final ProductDetailsApiService _productDetailsApiService;

  ProductDetailsDataSourceImpl(
    this._productDetailsApiService,
  );
  
  @override
  Future<BaseResponse> addProductToFavorites(int productId) {
   return _productDetailsApiService.addProductToFavorites(productId);
  }
  
  @override
  Future<ProductDetailsResponse> getProductDetails(String productId) {
    return _productDetailsApiService.getProductDetails(productId);
  }
}