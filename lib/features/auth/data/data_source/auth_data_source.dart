import 'package:groceries_app/core/data/models/auth/auth_response.dart';
import 'package:groceries_app/features/auth/data/api/auth_api_service.dart';
import 'package:groceries_app/features/auth/data/models/login_request.dart';
import 'package:groceries_app/features/auth/data/models/register_request.dart';

abstract class AuthDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiService _authApiService;

  AuthDataSourceImpl(this._authApiService);
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return _authApiService.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return _authApiService.register(registerRequest);
  }
}
