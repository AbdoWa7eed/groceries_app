abstract class UiConstants {
  static const int passwordMaxLength = 32;
  static const int passwordMinLength = 6;
  static const int usernameMinLength = 10;
  static const int snackBarDuration = 3000;
  static const int pageTransitionDelay = 1000;
  static const int pageReverseTransitionDelay = 500;
  static RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
}
