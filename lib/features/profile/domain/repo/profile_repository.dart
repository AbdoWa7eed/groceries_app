import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/profile/data/models/update_user_request.dart';

abstract class ProfileRepository {
  ResultFuture<UserEntity> updateProfile(UpdateUserRequest request);
}
