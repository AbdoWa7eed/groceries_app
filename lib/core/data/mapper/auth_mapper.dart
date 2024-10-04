import 'package:groceries_app/core/data/mapper/user_mapper.dart';
import 'package:groceries_app/core/data/models/auth/auth_response.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/features/auth/domain/entities/auth_entity.dart';

extension UserMapper on AuthDataResponse {
  AuthEntity toAuthEntity() {
    return AuthEntity(
      user: user.toUserEntity(),
      accessToken: accessToken.orEmpty(),
      refreshToken: refreshToken.orEmpty(),
    );
  }
}
