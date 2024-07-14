import 'package:groceries_app/features/auth/data/models/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String message;
  final AuthDataResponse? data;

  AuthResponse({
    required this.message,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthDataResponse {
  final UserResponse user;
  final String accessToken;
  final String refreshToken;

  AuthDataResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) => _$AuthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataResponseToJson(this);
}
