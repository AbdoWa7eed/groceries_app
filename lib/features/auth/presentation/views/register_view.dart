import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
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

          if (state is RegisterSuccessState) {
            context.popAllThenPush(Routes.phoneAuthRoute, extra: true);
          }
        },
        child: const SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
