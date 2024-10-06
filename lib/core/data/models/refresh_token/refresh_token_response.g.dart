// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponse _$RefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponse(
      data: json['data'] == null
          ? null
          : RefreshTokenResponseModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponseModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );
