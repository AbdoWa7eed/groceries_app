import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: LoginViewBody(),
      )),
    );
  }
}
