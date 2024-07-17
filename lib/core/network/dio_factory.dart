import 'dart:io';

import 'package:dio/dio.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String _applicationJson = "application/json";

abstract class DioFactory {
  static Dio? _dio;
  static Dio getDio() {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio();
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: _applicationJson,
      HttpHeaders.acceptHeader: _applicationJson,
      HttpHeaders.authorizationHeader:
          'Bearer ${getIt<AppPreferences>().getUserAccessToken()}'
    };
    _dio?.options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: headers,
        receiveTimeout: ApiConstants.apiTimeOut,
        sendTimeout: ApiConstants.apiTimeOut);

    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return _dio!;
  }

  static void setTokenIntoHeader(String token) {
    _dio?.options.headers = {
      HttpHeaders.authorizationHeader : 'Bearer $token',
    };
  }
}
