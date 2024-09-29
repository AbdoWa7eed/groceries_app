import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/utils/base_usecase.dart';
import 'package:groceries_app/features/auth/data/models/register_request.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';
import 'package:groceries_app/features/auth/domain/repo/auth_repository.dart';

class RegisterUseCase extends BaseUseCase<RegisterUseCaseInput, AuthEntity> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);
  @override
  ResultFuture<AuthEntity> execute(RegisterUseCaseInput input) async {
    return _authRepository.register(input);
  }
}

class RegisterUseCaseInput extends RegisterRequest {
  RegisterUseCaseInput(
      {required super.username, required super.email, required super.password});
}
