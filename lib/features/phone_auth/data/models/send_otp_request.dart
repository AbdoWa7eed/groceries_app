class SendOtpRequest {
  String phoneNumber;

  SendOtpRequest(this.phoneNumber);

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber};
  }
}
