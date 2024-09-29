import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/mapper/category_mapper.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/explore/data/data_source/explore_data_source.dart';
import 'package:groceries_app/features/explore/domain/repo/explore_repository.dart';

class ExploreRepositoryImpl extends ExploreRepository {
  final ExploreDataSource _exploreDataSource;

  ExploreRepositoryImpl(this._exploreDataSource);
  @override
  ResultFuture<List<CategoryEntity>> getCategories() async {
    try {
      final result = await _exploreDataSource.getCategories();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(
        result.data!.items?.map((category) => category.toEntity()).toList() ??
            [],
      );
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
