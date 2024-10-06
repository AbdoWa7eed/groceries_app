import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable(createToJson: false)
class RefreshTokenResponse extends BaseResponse {
  final RefreshTokenResponseModel? data;

  RefreshTokenResponse({required this.data, required super.message});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class RefreshTokenResponseModel {
  final String? accessToken;
  final String? refreshToken;

  RefreshTokenResponseModel(
      {required this.accessToken, required this.refreshToken});

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);
}
