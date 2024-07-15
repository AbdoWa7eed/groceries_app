import 'package:json_annotation/json_annotation.dart';
part 'failure.g.dart';

@JsonSerializable()
class Failure {
  int? code;
  String message;
  Failure({required this.code, required this.message});

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Failure copyWith({int? code, String? message}) =>
      Failure(code: code ?? this.code, message: message ?? this.message);
}
