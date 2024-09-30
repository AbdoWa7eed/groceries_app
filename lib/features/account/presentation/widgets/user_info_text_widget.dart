import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/account/presentation/cubit/account_cubit.dart';

class UserInfoTextWidget extends StatelessWidget {
  const UserInfoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AccountCubit cubit) => cubit.user);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.username, maxLines: 1, style: StylesManager.bold18),
          Text(user.email, style: StylesManager.regular16),
        ],
      ),
    );
  }
}
