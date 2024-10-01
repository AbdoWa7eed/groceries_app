import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<File, String> {
  const FileConverter();

  @override
  File fromJson(String json) => throw UnimplementedError();

  @override
  String toJson(File file) {
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }
}
