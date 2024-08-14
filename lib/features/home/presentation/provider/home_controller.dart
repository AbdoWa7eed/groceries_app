import 'package:flutter/material.dart';
import 'package:groceries_app/core/di/di.dart';

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
        break;
      case 3:
        break;
    }
  }

  int get index => _currentIndex;
}
