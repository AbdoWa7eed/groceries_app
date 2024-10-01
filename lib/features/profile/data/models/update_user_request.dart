import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import '../converters/file_converter.dart';

part 'update_user_request.g.dart';

@JsonSerializable(createFactory: false)
class UpdateUserRequest {
  @JsonKey(includeIfNull: false)
  final String? username;
  @JsonKey(includeIfNull: false)
  final String? email;
  @JsonKey(includeIfNull: false)
  @FileConverter()
  final File? image;

  UpdateUserRequest(
      {required this.username, required this.email, required this.image});

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
