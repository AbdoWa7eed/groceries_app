import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

showSnackBar(BuildContext context,
    {required String text, Color color = ColorManager.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: StylesManager.semiBold18,
    ),
    backgroundColor: color,
    duration: const Duration(milliseconds: 3000),
  ));
}
