import 'package:shared_preferences/shared_preferences.dart';

const String userAccessToken = "USER_TOKEN_REFS_KEY";
const String userRefreshToken = "USER_TOKEN_KEY_REFS";
const String userSeenOnboarding = "USER_SEEN_ONBOARDING";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  void setUserAccessToken(String token) async {
    await _sharedPreferences.setString(userAccessToken, token);
  }

  String? getUserAccessToken() {
    return _sharedPreferences.getString(userAccessToken);
  }

  void setUserRefreshToken(String token) async {
    await _sharedPreferences.setString(userRefreshToken, token);
  }

  String? getUserRefreshToken() {
    return _sharedPreferences.getString(userRefreshToken);
  }

  Future<void> setUserViewedOnboarding() async {
    await _sharedPreferences.setBool(userSeenOnboarding, true);
  }

  bool isOnboardingViewed() {
    return _sharedPreferences.getBool(userSeenOnboarding) ?? false;
  }
}
