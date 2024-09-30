import 'package:groceries_app/core/data/models/base_response.dart';
import 'package:groceries_app/core/data/models/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable(createToJson: false)
class ProfileResponse extends BaseResponse {
  @JsonKey(name: 'data')
  final UserResponse? user;

  ProfileResponse({required super.message, required this.user});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
