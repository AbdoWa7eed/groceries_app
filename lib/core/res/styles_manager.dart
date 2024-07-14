import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';

abstract class StylesManager {
  static const TextStyle regular16 = TextStyle(
      fontSize: FontSize.s16,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.darkGray);

  static const TextStyle regular48 = TextStyle(
      fontSize: FontSize.s48,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.white);

  static const TextStyle medium16 = TextStyle(
      fontSize: FontSize.s16,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.gray);

  static const TextStyle semiBold18 = TextStyle(
      fontSize: FontSize.s18,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.white);
}
