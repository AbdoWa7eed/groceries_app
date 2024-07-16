import 'package:flutter/material.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/phone_auth_view_body.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneAuthViewBody(),
    );
  }
}
