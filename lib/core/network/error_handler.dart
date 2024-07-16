// Imports
import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_error_messages.dart';
import 'package:groceries_app/core/network/failure.dart';

// Exception handler
class ErrorHandler implements Exception {
  late Failure _failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      _failure = _handleError(error);
    } else {
      _failure = DataSource.defaultError.getFailure();
    }
  }

  Failure get failure => _failure;

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null && error.response!.statusCode != null) {
          return Failure.fromJson(error.response!.data)
              .copyWith(code: error.response!.statusCode);
        } else {
          return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.connectionError.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.badCertificate.getFailure();
      case DioExceptionType.unknown:
        return DataSource.unknown.getFailure();
    }
  }
}

// Enums
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
  connectionError,
  badCertificate,
  unknown
}

// Constants for response codes
class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;
  static const int apiLogicError = 422;

  // Local status codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultCode = -7;
}

// Constants for response messages
class ResponseMessage {
  static const String noContent = ApiErrorMessages.noContent;
  static const String badRequest = ApiErrorMessages.badRequestError;
  static const String unauthorized = ApiErrorMessages.unauthorizedError;
  static const String forbidden = ApiErrorMessages.forbiddenError;
  static const String internalServerError =
      ApiErrorMessages.internalServerError;
  static const String notFound = ApiErrorMessages.notFoundError;

  // Local status messages
  static String connectTimeout = ApiErrorMessages.timeoutError;
  static String cancel = ApiErrorMessages.defaultError;
  static String receiveTimeout = ApiErrorMessages.timeoutError;
  static String sendTimeout = ApiErrorMessages.timeoutError;
  static String cacheError = ApiErrorMessages.cacheError;
  static String noInternetConnection = ApiErrorMessages.noInternetError;
  static String defaultError = ApiErrorMessages.defaultError;
  static String badCertificate = ApiErrorMessages.badCertificateError;
  static String unknown = ApiErrorMessages.unknownError;
}

// Extensions
extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(
            code: ResponseCode.unauthorized,
            message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            code: ResponseCode.connectTimeout,
            message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(
            code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            code: ResponseCode.receiveTimeout,
            message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(
            code: ResponseCode.sendTimeout,
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(
            code: ResponseCode.defaultCode,
            message: ResponseMessage.defaultError);
      case DataSource.connectionError:
        return Failure(
            code: ResponseCode.defaultCode,
            message: ResponseMessage.noInternetConnection);
      case DataSource.badCertificate:
        return Failure(
            code: ResponseCode.defaultCode,
            message: ResponseMessage.badCertificate);
      case DataSource.unknown:
        return Failure(
            code: ResponseCode.defaultCode, message: ResponseMessage.unknown);
    }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
