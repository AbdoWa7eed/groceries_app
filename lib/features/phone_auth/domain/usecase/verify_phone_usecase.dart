import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/phone_auth/data/models/verify_otp_request.dart';
import 'package:groceries_app/features/phone_auth/domain/repo/phone_auth_repo.dart';

class VerifyPhoneUsecase extends BaseUseCase<VerifyPhoneUsecaseInput, String> {
  final PhoneAuthRepository _authRepository;

  VerifyPhoneUsecase(this._authRepository);
  @override
  ResultFuture<String> execute(input) {
    return _authRepository.verifyOTP(input);
  }
}

class VerifyPhoneUsecaseInput extends VerifyOTPRequest {
  VerifyPhoneUsecaseInput({required super.verificationId, required super.code});
}
