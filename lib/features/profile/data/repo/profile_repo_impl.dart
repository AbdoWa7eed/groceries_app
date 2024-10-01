import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/mapper/user_mapper.dart';
import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:groceries_app/features/profile/data/models/update_user_request.dart';
import 'package:groceries_app/features/profile/domain/repo/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  ResultFuture<UserEntity> updateProfile(UpdateUserRequest request) async {
    try {
      final result = await _profileDataSource.updateProfile(request);
      if (result.user == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.user!.toUserEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
