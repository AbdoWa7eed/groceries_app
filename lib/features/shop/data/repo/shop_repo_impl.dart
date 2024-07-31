import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/entities/product_entity.dart';
import 'package:groceries_app/core/models/mapper.dart';
import 'package:groceries_app/core/models/product_request_params.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/shop/data/data_source/shop_data_source.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';

class ShopRespositoryImpl implements ShopRepository {
  final ShopDataSource _shopDataSource;

  ShopRespositoryImpl(this._shopDataSource);
  @override
  ResultFuture<List<ProductEntity>> getBestSelling() async {
    try {
      final result = await _shopDataSource.getBestSelling();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.data!.items?.map((e) => e.toEntity()).toList() ?? []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getExclusiveOffers() async {
    try {
      final result = await _shopDataSource.getExclusiveOffers();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.data!.items?.map((e) => e.toEntity()).toList() ?? []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getGroceries(
      ProductsRequestParams request) async {
    try {
      final result = await _shopDataSource.getGroceries(request);
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.data!.items?.map((e) => e.toEntity()).toList() ?? []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
