import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';

abstract class StylesManager {
  static const TextStyle regular14 = TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.darkGray);

  static const TextStyle regular16 = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.darkGray);

  static const TextStyle regular18 = TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.white);

  static const TextStyle regular26 = TextStyle(
      fontSize: FontSize.s26,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.dark);

  static const TextStyle regular48 = TextStyle(
      fontSize: FontSize.s48,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.white);

  static const TextStyle medium12 = TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.darkGray);

  static const TextStyle medium14 = TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.darkGray);

  static const TextStyle medium16 = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.gray);

  static const TextStyle medium18 = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.dark);

  static const TextStyle semiBold14 = TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.white);

  static const TextStyle semiBold18 = TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.white);

  static const TextStyle semiBold22 = TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.dark);

  static const TextStyle semiBold26 = TextStyle(
      fontSize: FontSize.s26,
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.dark);

  static const TextStyle bold16 = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.dark);

  static const TextStyle bold18 = TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.dark);

  static const TextStyle bold24 = TextStyle(
      fontSize: FontSize.s24,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.dark);
}
