import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/change_password/presentation/cubit/change_password_cubit.dart';

class ChangePasswordListener extends StatelessWidget {
  const ChangePasswordListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordError) {
          showSnackBar(
            context,
            text: state.error,
          );
        }

        if (state is ChangePasswordSuccess) {
          context.pop();
          showSnackBar(
            context,
            color: ColorManager.primary,
            text: state.message,
          );
        }
      },
      child: child,
    );
  }
}
