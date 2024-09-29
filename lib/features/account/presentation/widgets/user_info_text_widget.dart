import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

class UserInfoTextWidget extends StatelessWidget {
  const UserInfoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Abdelrahman Waheed', maxLines: 1, style: StylesManager.bold18),
          Text('abdo@gmail.com', style: StylesManager.regular16),
        ],
      ),
    );
  }
}
