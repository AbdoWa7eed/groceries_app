import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  final IconData? icon;

  const CustomBackButton({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon ?? Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
