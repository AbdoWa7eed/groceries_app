import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/mapper/product_mapper.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/shop/data/data_source/shop_data_source.dart';
import 'package:groceries_app/features/shop/data/models/banner_mapper.dart';
import 'package:groceries_app/features/shop/domain/entities/banner_entity.dart';
import 'package:groceries_app/features/shop/domain/repo/shop_repository.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopDataSource _shopDataSource;

  ShopRepositoryImpl(this._shopDataSource);
  @override
  ResultFuture<List<ProductEntity>> getBestSelling() async {
    try {
      final result = await _shopDataSource.getBestSelling();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
          result.data!.items?.map((product) => product.toEntity()).toList() ??
              []);
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
      return Right(
          result.data!.items?.map((product) => product.toEntity()).toList() ??
              []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<List<BannerEntity>> getBanners() async {
    try {
      final result = await _shopDataSource.getBanners();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
          result.data!.items?.map((banner) => banner.toEntity()).toList() ??
              []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
