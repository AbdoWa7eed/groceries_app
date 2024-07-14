abstract class ApiErrorMessages {
  static const String badRequestError =
      "The server could not understand the request due to invalid syntax.";
  static const String noContent =
      "No content available for the requested resource.";
  static const String forbiddenError = "Access to the resource is forbidden.";
  static const String unauthorizedError =
      "Authentication is required and has failed or has not yet been provided.";
  static const String notFoundError =
      "The requested resource could not be found.";
  static const String conflictError =
      "The request could not be completed due to a conflict with the current state of the resource.";
  static const String internalServerError =
      "The server encountered an unexpected condition that prevented it from fulfilling the request.";
  static const String unknownError = "An unexpected error occurred.";
  static const String timeoutError =
      "The request timed out while waiting for a response.";
  static const String defaultError =
      "An error occurred while processing the request.";
  static const String cacheError =
      "An error occurred while accessing cached data.";
  static const String noInternetError = "No internet connection available.";
  static const String ok = "Ok";
  static const String badCertificateError =
      "The server's SSL certificate is not trusted or expired, causing a security risk.";
}
