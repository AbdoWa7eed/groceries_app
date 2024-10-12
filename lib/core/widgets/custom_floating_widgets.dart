import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/font_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';

showSnackBar(BuildContext context,
    {required String text, Color color = ColorManager.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: StylesManager.semiBold18,
    ),
    backgroundColor: color,
    duration: const Duration(milliseconds: UiConstants.snackBarDuration),
  ));
}

showToast({required String text, Color color = ColorManager.error}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    fontAsset: 'assets/fonts/Gilroy.ttf',
    textColor: Colors.white,
    fontSize: FontSize.s18,
  );
}
