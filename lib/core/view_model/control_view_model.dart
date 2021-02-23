import 'package:ecommerce_app/view/cart_screen.dart';
import 'package:ecommerce_app/view/home_screen.dart';
import 'package:ecommerce_app/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContorlViewModel extends GetxController {
  int _navigatorIndex = 0;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;
  get navigatorIndex => _navigatorIndex;
  void changeSelectedValue(int selectedValue) {
    _navigatorIndex = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
        break;
    }
    update();
  }
}
