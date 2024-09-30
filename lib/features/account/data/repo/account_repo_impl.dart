import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/mapper/user_mapper.dart';
import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/account/data/data_source/account_data_source.dart';
import 'package:groceries_app/features/account/domain/repo/account_repo.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource _accountDataSource;

  AccountRepositoryImpl(this._accountDataSource);

  @override
  ResultFuture<UserEntity> getProfile() async {
    try {
      final response = await _accountDataSource.getProfile();
      if (response.user == null) {
        return Left(Failure.apiInternalError(response.message));
      }
      return Right(response.user!.toUserEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> logout() async {
    try {
      final response = await _accountDataSource.logout();
      return Right(response.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
