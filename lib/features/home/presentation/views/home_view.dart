import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:groceries_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      backgroundColor: ColorManager.white,
      body: const HomeViewBody(),
      bottomNavigationBar: CustomNavBarWidget(),
    );
  }
}
