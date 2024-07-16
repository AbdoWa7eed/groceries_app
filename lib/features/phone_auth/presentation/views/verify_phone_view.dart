import 'package:flutter/material.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/verify_phone_view_body.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyPhoneViewBody(),
    );
  }
}
