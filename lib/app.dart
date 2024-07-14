import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/theme_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';

class NectarApp extends StatefulWidget {
  const NectarApp._internal();

  static const NectarApp _instance = NectarApp._internal();

  factory NectarApp() => _instance;

  @override
  State<NectarApp> createState() => _NectarAppState();
}

class _NectarAppState extends State<NectarApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      routerConfig: RouteGenerator.router,
      theme: appTheme,
      title: AppStrings.title,
    );
  }
}
