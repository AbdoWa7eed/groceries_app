import 'package:groceries_app/core/models/base_response.dart';

class OTPResponse extends BaseResponse {
  final String? verificationId;

  OTPResponse({required super.message, required this.verificationId});

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      message: json['message'],
      verificationId: json['data']['verificationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'verificationId': verificationId,
    };
  }
}
