import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

ThemeData get appTheme {
  return ThemeData(
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.primaryWith10Opacity,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primaryWith10Opacity,
        primary: ColorManager.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16)),
          backgroundColor: ColorManager.primary,
          elevation: 0,
        ),
      ),
      fontFamily: FontConstants.fontFamily,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        color: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
      splashColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: StylesManager.regular16,
        floatingLabelStyle: StylesManager.regular16,
        labelStyle: StylesManager.regular16,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGray)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGray)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ));
}
