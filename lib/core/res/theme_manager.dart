import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

ThemeData get appTheme {
  return ThemeData(
    useMaterial3:false,
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primaryWith10Opacity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryWith10Opacity,
      primary: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s16)),
          backgroundColor: ColorManager.primary,
          elevation: 0,
        ),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      color: ColorManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      centerTitle: true,
      titleTextStyle: StylesManager.regular16,
    ),
    splashColor: Colors.transparent,
  );
}
