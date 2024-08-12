import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/data_source/favorite_data_source.dart';
import 'package:groceries_app/core/data/models/mapper.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/domain/repo/favorite_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDataSource _favoriteDataSource;

  FavoriteRepositoryImpl(this._favoriteDataSource);
  @override
  ResultFuture<String> addFavorite(int productId) async {
    try {
      final result = await _favoriteDataSource.addFavorite(productId);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getFavorites() async {
    try {
      final result = await _favoriteDataSource.getFavorites();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
        result.data!.items?.map((product) => product.toEntity()).toList() ?? [],
      );
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> removeFavorite(int productId) async {
    try {
      final result = await _favoriteDataSource.removeFavorite(productId);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
