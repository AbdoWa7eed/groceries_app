import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequest {
  final String verificationId;
  final String password;

  ResetPasswordRequest({
    required this.verificationId,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
