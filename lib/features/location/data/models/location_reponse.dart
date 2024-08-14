
import 'package:json_annotation/json_annotation.dart';

abstract class LocationResponse {
  @JsonKey(name:"status")
  final String status;
  LocationResponse(this.status);
}