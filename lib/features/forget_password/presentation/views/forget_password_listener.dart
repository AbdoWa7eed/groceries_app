import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/forget_password/presentation/cubit/forget_password_cubit.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener(
      {super.key,
      required this.child,
      this.onLoading,
      this.onSuccess,
      this.onError});

  final Function? onLoading;
  final Function(dynamic data)? onSuccess;
  final Function(String error)? onError;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ForgetPasswordLoading():
            onLoading?.call();
            break;
          case ForgetPasswordSuccess():
            onSuccess?.call(state.data);
            break;
          case ForgetPasswordError():
            if (onError == null) {
              showSnackBar(context, text: state.error);
            } else {
              onError?.call(state.error);
            }
            break;
          default:
            break;
        }
      },
      child: child,
    );
  }
}
