import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 70),
      child: Center(child: SvgPicture.asset(AssetsManager.carrotLogo)),
    );
  }
}
