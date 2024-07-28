
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class LocationResponse {
  @JsonKey(name:"status")
  final String status;
  LocationResponse(this.status);
}