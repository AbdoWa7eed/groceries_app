import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/forget_password/data/models/reset_password_request.dart';
import 'package:groceries_app/features/forget_password/domain/repo/forget_password_repo.dart';

class ResetPasswordUseCase
    extends BaseUseCase<ResetPasswordUseCaseInput, AuthEntity> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ResetPasswordUseCase(this._forgetPasswordRepository);

  @override
  ResultFuture<AuthEntity> execute(ResetPasswordUseCaseInput input) async {
    return _forgetPasswordRepository.resetPassword(input);
  }
}

class ResetPasswordUseCaseInput extends ResetPasswordRequest {
  ResetPasswordUseCaseInput({
    required super.verificationId,
    required super.password,
  });
}
