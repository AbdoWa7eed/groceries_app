import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:groceries_app/core/network/api_error_messages.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/dio_factory.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/core/network/refresh_token/refresh_token_api_service.dart';
import 'package:groceries_app/core/utils/app_preferences.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/logout_dialog_widget.dart';

class RefreshTokenInterceptor extends Interceptor {
  final RefreshTokenApiService apiService;
  final AppPreferences _appPreferences;


  bool _isRefreshing = false;
  RefreshTokenInterceptor(this.apiService, this._appPreferences);

  ResultFuture<String> refreshAccessToken() async {
    if (_isRefreshing) {
      return Left(Failure.conflict('Token is being refreshed'));
    }
    _isRefreshing = true;

    try {

      final response = await apiService.refreshToken(refreshToken!);

      if (response.data == null) {
        return Left(Failure.apiInternalError(response.message));
      }
      final newToken = response.data!.accessToken!;
      await _appPreferences.setUserAccessToken(newToken);
      await _appPreferences.setUserRefreshToken(response.data!.refreshToken!);

      return Right(newToken);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    } finally {
      _isRefreshing = false;
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == HttpStatus.unauthorized && refreshToken != null) {
      final newTokenResult = await refreshAccessToken();
      if (newTokenResult.isRight()) {
        final newToken = newTokenResult.right;
        DioFactory.setTokenIntoHeader(newToken);
        final requestOptions = err.requestOptions;
        final clonedRequest = await DioFactory.getDio().request(
          requestOptions.path,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers
              ..[HttpHeaders.authorizationHeader] = 'Bearer $newToken',
          ),
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );
        handler.resolve(clonedRequest);
      } else {
        showLogoutDialog();
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: ApiErrorMessages.sessionExpiredError,
        ));
      }
    } else {
      handler.next(err);
    }
  }

  String? get refreshToken => _appPreferences.getUserRefreshToken();

}
