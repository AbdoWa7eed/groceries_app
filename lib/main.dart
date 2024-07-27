import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/bloc_observer.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:bloc/bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await FlutterConfig.loadEnvVariables();
  Bloc.observer = MyBlocObserver();
  runApp(NectarApp());
}
