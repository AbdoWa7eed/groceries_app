import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:groceries_app/core/network/refresh_token/refresh_token_api_service.dart';
import 'package:groceries_app/core/network/refresh_token_interceptor.dart'; // Import your TokenInterceptor
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String _applicationJson = "application/json";

abstract class DioFactory {
  static Dio? _dio;

  static const _basicHeaders = {
    HttpHeaders.contentTypeHeader: _applicationJson,
    HttpHeaders.acceptHeader: _applicationJson,
  };

  static Dio getDio() {
    if (_dio != null) {
      return _dio!;
    }

    _dio = Dio();

    final appPreferences = getIt<AppPreferences>();
    final Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader:
          'Bearer ${appPreferences.getUserAccessToken()}',
    };
    headers.addAll(_basicHeaders);
    _dio?.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      receiveTimeout: ApiConstants.apiTimeOut,
      sendTimeout: ApiConstants.apiTimeOut,
    );

    if (kDebugMode) {
      _dio?.interceptors.add(
        PrettyDioLogger(
          requestBody: false,
          responseBody: false,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }

    _dio?.interceptors.add(
      RefreshTokenInterceptor(
        getIt<RefreshTokenApiService>(),
        getIt<AppPreferences>(),
      ),
    );

    return _dio!;
  }

  static Dio getNewDioInstance() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: _basicHeaders,
      receiveTimeout: ApiConstants.apiTimeOut,
      sendTimeout: ApiConstants.apiTimeOut,
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: false,
        responseBody: false,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio;
  }

  static void setTokenIntoHeader(String token) {
    _dio?.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }
}
