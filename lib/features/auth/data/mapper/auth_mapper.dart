import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/data/models/auth_response.dart';
import 'package:groceries_app/features/auth/domain/entity/user_entity.dart';

extension AuthMapper on AuthDataResponse {
  UserEntity toUserEntity() {
    return UserEntity(
      userId: user.userId.orZero(),
      username: user.username.orEmpty(),
      email: user.email.orEmpty(),
      address: user.address.orEmpty(),
      phoneNumber: user.phoneNumber.orEmpty(),
      imageUrl: user.imageUrl.orEmpty(),
      role: user.role.orEmpty(),
      accessToken: accessToken.orEmpty(),
      refreshToken: refreshToken.orEmpty(),
    );
  }
}
