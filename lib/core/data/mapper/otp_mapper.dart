import 'package:groceries_app/core/data/models/otp/otp_response.dart';
import 'package:groceries_app/core/domain/entities/otp_entity.dart';
import 'package:groceries_app/core/utils/extensions.dart';

extension OTPResponseToEntityMapper on OTPResponse {
  OTPEntity toEntity() {
    return OTPEntity(
      message: message.orEmpty(),
      verificationId: verificationId.orEmpty(),
    );
  }
}
