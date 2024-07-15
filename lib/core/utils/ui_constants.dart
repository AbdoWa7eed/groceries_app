abstract class UiConstants {
  static const int passwordMaxLength = 32;
  static const int passwordMinLength = 6;
  static const int usernameMinLength = 10;
  static const int snackBarDuration = 3000;
  static RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
}
