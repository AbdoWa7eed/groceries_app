import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/phone_auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/verify_phone_view_body.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is VerifyOTPErrorState) {
          showSnackBar(context, text: state.errorMessage);
        }

        if (state is VerifyOTPSuccessState) {
          if (context.read<PhoneAuthCubit>().isAuth) {
            context.popAllThenPush(Routes.locationRoute, extra: true);
          } else {
            //TODO: Added pop navigation after finishing account feature
          }
        }
      },
      child: const Scaffold(
        body: VerifyPhoneViewBody(),
      ),
    );
  }
}
