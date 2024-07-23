import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/phone_auth/data/data_source/phone_auth_data_source.dart';
import 'package:groceries_app/features/phone_auth/data/models/mapper.dart';
import 'package:groceries_app/features/phone_auth/data/models/verify_otp_request.dart';
import 'package:groceries_app/features/phone_auth/domain/entity/otp_entity.dart';
import 'package:groceries_app/features/phone_auth/domain/repo/phone_auth_repo.dart';

class PhoneAuthRepositoryImpl extends PhoneAuthRepository {
  final PhoneAuthDataSource _dataSource;

  PhoneAuthRepositoryImpl(this._dataSource);
  @override
  ResultFuture<OTPEntity> sendOTP(String phoneNumber) async {
    try {
      final result = await _dataSource.sendOTP(phoneNumber);

      if (result.verificationId == null) {
        return Left(Failure.apiInternalError(result.message.orEmpty()));
      }
      return Right(result.toEntity());
    } catch (error) {  
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> verifyOTP(VerifyOTPRequest request) async {
    try {
      final result = await _dataSource.verifyOTP(request);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
