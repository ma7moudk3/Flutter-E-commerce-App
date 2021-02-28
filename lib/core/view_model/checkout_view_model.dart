import 'package:ecommerce_app/helper/constants.dart';
import 'package:ecommerce_app/view/controller_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  int _index = 0;
  int get index => _index;
  set index(int index) {
    this._index = index;
  }

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      _pages = Pages.Summary;
    } else if (_index == 3) {
      Get.to(ControllerView());
    }
    update();
  }

  Color getColor(int index) {
    if (index == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  @override
  void onInit() {
    super.onInit();
    changeIndex(0);
  }
}
