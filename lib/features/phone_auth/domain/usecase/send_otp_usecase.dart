import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/phone_auth/domain/repo/phone_auth_repo.dart';

class SendOTPUsecase extends BaseUseCase<String, OTPEntity> {
  final PhoneAuthRepository _authRepository;

  SendOTPUsecase(this._authRepository);
  @override
  ResultFuture<OTPEntity> execute(String input) {
    return _authRepository.sendOTP(input);
  }
}
