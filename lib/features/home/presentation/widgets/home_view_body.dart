import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        return PageView(
          controller: provider.pageController,
          onPageChanged: (index) {
            provider.setIndex(index);
          },
          children: const [
            Placeholder(color: ColorManager.blue),
            Placeholder(color: ColorManager.error),
            Placeholder(color: ColorManager.gray),
            Placeholder(color: ColorManager.primary),
            Placeholder(color: ColorManager.primary),
          ],
        );
      },
    );
  }
}
