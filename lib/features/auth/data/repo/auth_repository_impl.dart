import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:groceries_app/features/auth/data/mapper/auth_mapper.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:groceries_app/features/auth/data/models/register_request.dart';
import 'package:groceries_app/features/auth/domain/entity/user_entity.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);
  @override
  ResultFuture<UserEntity> login(LoginRequest loginRequest) async {
    try {
      final result = await _authDataSource.login(loginRequest);

      if (result.data == null) {
        return Left(
            Failure(code: ApiInternalStatus.failure, message: result.message));
      }
      return Right(result.data!.toUserEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<UserEntity> register(RegisterRequest registerRequest) async {
    try {
      final result = await _authDataSource.register(registerRequest);

      if (result.data == null) {
        return Left(
            Failure(code: ApiInternalStatus.failure, message: result.message));
      }
      return Right(result.data!.toUserEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
