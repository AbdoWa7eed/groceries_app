import 'package:flutter/material.dart';
import 'package:groceries_app/features/account/presentation/views/account_view.dart';
import 'package:groceries_app/features/cart/presentation/views/cart_view.dart';
import 'package:groceries_app/features/explore/presentation/views/explore_view.dart';
import 'package:groceries_app/features/favorites/presentation/views/favorites_view.dart';
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
          children: const [
            ShopView(),
            ExploreView(),
            CartView(),
            FavoritesView(),
            AccountView(),
          ],
        );
      },
    );
  }
}
