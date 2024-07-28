import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/home/presentation/widgets/home_view_body.dart';
import 'package:groceries_app/features/home/presentation/widgets/custom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: const HomeViewBody(),
        bottomNavigationBar: CustomNavBarWidget(),
      );
  }
}
