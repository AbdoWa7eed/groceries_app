import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/phone_auth/data/models/otp_response/otp_response.dart';
import 'package:groceries_app/features/phone_auth/domain/entity/otp_entity.dart';

extension OTPResponseToEntityMapper on OTPResponse {
  OTPEntity toEntity() {
    return OTPEntity(
      message: message.orEmpty(),
      verificationId: verificationId.orEmpty(),
    );
  }
}
