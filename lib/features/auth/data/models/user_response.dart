import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int? userId;
  final String? username;
  final String? email;
  final String? address;
  final String? phoneNumber;
  final String? imageUrl;
  final String? role;

  UserResponse({
    required this.userId,
    required this.username,
    required this.email,
    this.address,
    required this.phoneNumber,
    required this.imageUrl,
    required this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
