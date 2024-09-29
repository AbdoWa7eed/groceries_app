import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';

class LoginUseCase extends BaseUseCase<LoginUseCaseInput, AuthEntity> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  @override
  ResultFuture<AuthEntity> execute(LoginUseCaseInput input) async {
    return _authRepository.login(input);
  }
}

class LoginUseCaseInput extends LoginRequest {
  LoginUseCaseInput({required super.email, required super.password});
}
