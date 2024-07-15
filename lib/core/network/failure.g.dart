// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
