import 'package:flutter/material.dart';
import 'package:groceries_app/core/di/di.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';

class HomeController extends ChangeNotifier {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  void setIndex(int index) {
    _currentIndex = index;
    pageController.jumpToPage(index);
    _setDi(index);
    notifyListeners();
  }

  void _setDi(index) {
    switch (index) {
      case 1:
        initExploreDi();
        break;
      case 2:
        getIt<CartCubit>().initCart();
        break;
      case 3:
        getIt<FavoriteCubit>().initFavorite();
        break;
    }
  }

  void backToHome() {
    setIndex(0);
  }

  int get index => _currentIndex;
}
