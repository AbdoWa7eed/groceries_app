import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:groceries_app/features/product_details/data/mapper/product_datails_mapper.dart';
import 'package:groceries_app/features/product_details/domain/entities/product_details_entity.dart';
import 'package:groceries_app/features/product_details/domain/repo/product_details_repo.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepository {
  final ProductDetailsDataSource _productDetailsDataSource;

  ProductDetailsRepoImpl(this._productDetailsDataSource);

  @override
  ResultFuture<String> addToFavorites(int productId) async {
    try {
      final result =
          await _productDetailsDataSource.addProductToFavorites(productId);

      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<ProductDetailsEntity> getProductDetails(int productId) async {
    try {
      final result = await _productDetailsDataSource
          .getProductDetails(productId.toString());
      if (result.productDetails == null) {
        return Left(Failure.apiInternalError(result.message));
      }

      return Right(result.productDetails!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
