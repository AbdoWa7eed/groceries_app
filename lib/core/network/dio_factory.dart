import 'dart:io';

import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String _applicationJson = "application/json";

abstract class DioFactory {
  static Dio getDio() {
    Dio dio = Dio();
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: _applicationJson,
      HttpHeaders.acceptHeader: _applicationJson,
    };
    dio.options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: headers,
        receiveTimeout: ApiConstants.apiTimeOut,
        sendTimeout: ApiConstants.apiTimeOut);

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}
