import 'package:groceries_app/core/domain/entities/user_entity.dart';
import 'package:groceries_app/core/network/api_result.dart';

abstract class AccountRepository {

  ResultFuture<String> logout();

  ResultFuture<UserEntity> getProfile();
}