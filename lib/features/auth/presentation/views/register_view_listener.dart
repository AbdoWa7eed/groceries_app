import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/features/auth/presentation/cubit/auth_cubit.dart';

class RegisterViewListener extends StatelessWidget {
  const RegisterViewListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showSnackBar(
            context,
            text: state.message,
          );
        }

        if (state is RegisterSuccessState) {
          context.popAllThenPush(Routes.phoneAuthRoute,
              extra: PhoneAuthPurpose.newAccount);
        }
      },
      child: child,
    );
  }
}
