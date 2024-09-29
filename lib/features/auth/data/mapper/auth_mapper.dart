import 'package:groceries_app/core/data/mapper/user_mapper.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/data/models/auth_response.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';

extension UserMapper on AuthDataResponse {
  AuthEntity toUserEntity() {
    return AuthEntity(
      user: user.toUserEntity(),
      accessToken: accessToken.orEmpty(),
      refreshToken: refreshToken.orEmpty(),
    );
  }
}
