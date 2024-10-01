import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/features/change_password/data/data_source/change_password_data_source.dart';
import 'package:groceries_app/features/change_password/data/models/change_password_request.dart';
import 'package:groceries_app/features/change_password/domain/repo/change_password_repo.dart';

class ChangePasswordRepositoryImpl extends ChangePasswordRepository {
  final ChangePasswordDataSource _changePasswordDataSource;

  ChangePasswordRepositoryImpl(this._changePasswordDataSource);

  @override
  ResultFuture<String> changePassword(ChangePasswordRequest request) async {
    try {
      final result = await _changePasswordDataSource.changePassword(request);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
