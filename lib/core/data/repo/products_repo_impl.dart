import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/data_source/products_data_source.dart';
import 'package:groceries_app/core/data/models/mapper.dart';
import 'package:groceries_app/core/data/models/product_request_params.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/repo/products_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource _productsDataSource;

  ProductsRepositoryImpl(this._productsDataSource);
  @override
  ResultFuture<List<ProductEntity>> getProducts(
      ProductsRequestParams request) async {
    try {
      final result = await _productsDataSource.getProducts(request);
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
          result.data!.items?.map((product) => product.toEntity()).toList() ??
              []);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
