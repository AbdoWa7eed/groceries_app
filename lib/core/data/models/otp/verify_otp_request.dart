import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOTPRequest {
  String verificationId;
  String code;

  VerifyOTPRequest({
    required this.verificationId,
    required this.code,
  });

  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);
}
