import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';

class LoginViewListener extends StatelessWidget {
  const LoginViewListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showSnackBar(
            context,
            text: state.message,
          );
        }

        if (state is LoginSuccessState) {
          context.pushReplacement(Routes.homeRoute);
        }
      },
      child: child,
    );
  }
}
