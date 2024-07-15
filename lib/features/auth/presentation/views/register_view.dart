import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:groceries_app/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            showSnackBar(
              context,
              text: state.message,
            );
          }
        },
        child: const SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
