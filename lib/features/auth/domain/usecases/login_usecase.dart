import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:groceries_app/features/auth/domain/entity/user_entity.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';

class LoginUseCase extends BaseUseCase<LoginUseCaseInput, UserEntity> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  @override
  ResultFuture<UserEntity> execute(LoginUseCaseInput input) async {
    return _authRepository.login(input);
  }
}

class LoginUseCaseInput extends LoginRequest {
  LoginUseCaseInput({required super.email, required super.password});
}
