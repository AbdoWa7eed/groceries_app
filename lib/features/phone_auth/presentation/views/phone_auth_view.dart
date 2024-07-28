import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/phone_auth_view_body.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is SendOTPErrorState) {
          context.pop();
          showSnackBar(context, text: state.errorMessage);
        }

        if (state is SendOTPSuccessState) {
          context.pop();
          context.push(Routes.verifyPhoneRoute);
        }
      },
      child: const Scaffold(body: PhoneAuthViewBody()),
    );
  }
}
