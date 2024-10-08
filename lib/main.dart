import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/bloc_observer.dart';
import 'package:groceries_app/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await dotenv.load();
  Bloc.observer = MyBlocObserver();
  runApp(NectarApp());
}
