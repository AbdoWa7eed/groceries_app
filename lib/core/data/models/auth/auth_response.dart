import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends BaseResponse{
  final AuthDataResponse? data;

  AuthResponse({
    required super.message,
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

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataResponseToJson(this);
}
