import 'package:flutter/material.dart';
import 'package:groceries_app/features/onboarding/widgets/onboarding_view_body.dart';
import 'package:flutter/services.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OnboardingViewBody(),
      ),
    );
  }
}
