import 'package:groceries_app/core/network/error_handler.dart';
import 'package:json_annotation/json_annotation.dart';
part 'failure.g.dart';

@JsonSerializable(createToJson: false)
class Failure {
  int? code;
  String message;
  Failure({required this.code, required this.message});

  factory Failure.apiInternalError(String message) => Failure(
        code: ApiInternalStatus.failure,
        message: message,
      );

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Failure copyWith({int? code, String? message}) =>
      Failure(code: code ?? this.code, message: message ?? this.message);
}
