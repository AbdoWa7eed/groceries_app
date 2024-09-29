import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:groceries_app/features/auth/data/models/register_request.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  ResultFuture<AuthEntity> login(LoginRequest loginRequest);

  ResultFuture<AuthEntity> register(RegisterRequest registerRequest);
}
