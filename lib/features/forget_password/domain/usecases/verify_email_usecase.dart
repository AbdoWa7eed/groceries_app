import 'package:groceries_app/core/data/models/otp/verify_otp_request.dart';
import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/forget_password/domain/repo/forget_password_repo.dart';

class VerifyEmailUseCase
    extends BaseUseCase<VerifyEmailUseCaseInput, OTPEntity> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  VerifyEmailUseCase(this._forgetPasswordRepository);

  @override
  ResultFuture<OTPEntity> execute(VerifyEmailUseCaseInput input) async {
    return _forgetPasswordRepository.verifyEmail(input);
  }
}

class VerifyEmailUseCaseInput extends VerifyOTPRequest {
  VerifyEmailUseCaseInput({required super.verificationId, required super.code});
}
