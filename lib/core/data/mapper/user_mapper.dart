import 'package:groceries_app/core/data/models/user/user_response.dart';
import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/utils/extensions.dart';

extension UserMapper on UserResponse {
  UserEntity toUserEntity() {
    return UserEntity(
      userId: userId.orZero(),
      username: username.orEmpty(),
      email: email.orEmpty(),
      address: address.orEmpty(),
      phoneNumber: phoneNumber.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      role: role.orEmpty(),
    );
  }
}
