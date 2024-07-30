import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/home/presentation/provider/home_controller.dart';
import 'package:provider/provider.dart';

class CustomNavBarWidget extends StatelessWidget {
  CustomNavBarWidget({super.key});

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AssetsManager.shop,
      ),
      activeIcon: SvgPicture.asset(
        AssetsManager.shop,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.shop,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AssetsManager.explore,
      ),
      activeIcon: SvgPicture.asset(
        AssetsManager.explore,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.explore,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsManager.cart),
      activeIcon: SvgPicture.asset(
        AssetsManager.cart,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.cart,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_rounded),
      label: AppStrings.favorite,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsManager.account),
      activeIcon: SvgPicture.asset(
        AssetsManager.account,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.account,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.lightGray,
                    blurRadius: AppSize.s2,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s20),
                  topRight: Radius.circular(AppSize.s20),
                )),
            child: BottomNavigationBar(
              backgroundColor: ColorManager.white,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: provider.index,
              onTap: (index) {
                provider.setIndex(index);
              },
              items: items,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.dark,
            ));
      },
    );
  }
}
