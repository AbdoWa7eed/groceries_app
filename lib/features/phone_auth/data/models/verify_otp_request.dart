import 'package:json_annotation/json_annotation.dart';
part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOTPRequest {
  String verificationId;
  String code;

  VerifyOTPRequest({
    required this.verificationId,
    required this.code,
  });

  factory VerifyOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPRequestFromJson(json);

  Map<String , dynamic> toJson() => _$VerifyOTPRequestToJson(this);
}
