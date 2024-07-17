class OTPResponse {
  final String? message;
  final String? verificationId;

  OTPResponse({required this.message, required this.verificationId});

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
