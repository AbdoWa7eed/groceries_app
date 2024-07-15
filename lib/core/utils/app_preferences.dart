import 'package:shared_preferences/shared_preferences.dart';

const String userAccessToken = "USER_TOKEN_REFS_KEY";
const String userRefreshToken = "USER_TOKEN_KEY_REFS";
class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<void> setUserAccessToken(String token) async {
    await _sharedPreferences.setString(userAccessToken, token);
  }

  Future<String> getUserAccessToken() async {
    return _sharedPreferences.getString(userAccessToken) ?? "";
  }

  Future<void> setUserRefreshToken(String token) async {
    await _sharedPreferences.setString(userRefreshToken, token);
  }

  Future<String> getUserRefreshToken() async {
    return _sharedPreferences.getString(userRefreshToken) ?? "";
  }


}
