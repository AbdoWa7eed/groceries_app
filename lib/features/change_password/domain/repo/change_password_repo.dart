import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/features/change_password/data/models/change_password_request.dart';

abstract class ChangePasswordRepository {
  ResultFuture<String> changePassword(ChangePasswordRequest request);
}
