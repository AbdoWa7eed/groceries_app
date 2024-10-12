import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';

abstract class JWTUtil {
  static int get currentUserId {
    final token = getIt<AppPreferences>().getUserAccessToken();
    final jwt = JWT.tryDecode(token.orEmpty());
    return jwt?.payload['userId'];
  }

  static bool isCurrentUser(int userId) {
    return currentUserId.toString() == userId.toString();
  }
}
