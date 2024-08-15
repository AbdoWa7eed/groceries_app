import 'package:flutter/material.dart';
import 'package:groceries_app/features/auth/presentation/views/register_view_listener.dart';
import 'package:groceries_app/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterViewListener(
      child: Scaffold(
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
