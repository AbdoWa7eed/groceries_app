import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/forget_password/domain/repo/forget_password_repo.dart';

class SendEmailVerificationCodeUseCase extends BaseUseCase<String, OTPEntity> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  SendEmailVerificationCodeUseCase(this._forgetPasswordRepository);

  @override
  ResultFuture<OTPEntity> execute(String input) async {
    return _forgetPasswordRepository.sendVerificationCode(input);
  }
}
