import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/mapper/auth_mapper.dart';
import 'package:groceries_app/core/data/mapper/otp_mapper.dart';
import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/forget_password/data/data_source/reset_password_data_source.dart';
import 'package:groceries_app/features/forget_password/data/models/reset_password_request.dart';
import 'package:groceries_app/features/forget_password/domain/repo/forget_password_repo.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordDataSource _forgetPasswordDataSource;

  ForgetPasswordRepositoryImpl(this._forgetPasswordDataSource);

  @override
  ResultFuture<AuthEntity> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response =
          await _forgetPasswordDataSource.resetPassword(resetPasswordRequest);
      if (response.data == null) {
        return Left(Failure.apiInternalError(response.message));
      }
      return Right(response.data!.toAuthEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<OTPEntity> sendVerificationCode(String email) async {
    try {
      final response =
          await _forgetPasswordDataSource.sendVerificationCode(email);
      return Right(response.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<OTPEntity> verifyEmail(VerifyOTPRequest verifyOTPRequest) async {
    try {
      final response =
          await _forgetPasswordDataSource.verifyEmail(verifyOTPRequest);
      return Right(response.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
