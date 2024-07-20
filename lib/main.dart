import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await FlutterConfig.loadEnvVariables();
  runApp(NectarApp());
}
