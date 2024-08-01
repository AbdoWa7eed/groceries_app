import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:groceries_app/features/shop/presentation/views/shop_view.dart';
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
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            provider.setIndex(index);
          },
          children: const [
            ShopView(),
            Placeholder(color: ColorManager.error),
            Placeholder(color: ColorManager.gray),
            Placeholder(color: ColorManager.primary),
            Placeholder(color: ColorManager.deepOrange),
          ],
        );
      },
    );
  }
}
