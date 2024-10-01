import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/change_password/data/models/change_password_request.dart';
import 'package:groceries_app/features/change_password/domain/repo/change_password_repo.dart';

class ChangePasswordUseCase
    extends BaseUseCase<ChangePasswordUseCaseInput, String> {
  final ChangePasswordRepository _changePasswordRepository;

  ChangePasswordUseCase(this._changePasswordRepository);

  @override
  ResultFuture<String> execute(ChangePasswordUseCaseInput input) async {
    return _changePasswordRepository.changePassword(input);
  }
}

class ChangePasswordUseCaseInput extends ChangePasswordRequest {
  ChangePasswordUseCaseInput(
      {required super.oldPassword, required super.newPassword});
}
