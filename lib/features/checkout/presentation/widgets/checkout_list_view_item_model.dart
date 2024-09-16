import 'package:flutter/material.dart';

class CheckoutListViewItemModel {
  String title;
  Widget suffix;
  Function()? onTap;
  CheckoutListViewItemModel(
      {required this.title, required this.suffix, this.onTap});
}
