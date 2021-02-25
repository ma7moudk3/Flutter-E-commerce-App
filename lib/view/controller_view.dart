import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:ecommerce_app/view/authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return GetBuilder<ContorlViewModel>(
            init: ContorlViewModel(),
            builder: (controller) => Scaffold(
              body: controller.currentScreen,
              bottomNavigationBar: bottomNavigationBar(),
            ),
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ContorlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  'assets/icon_explore.svg',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  'assets/icon_cart.svg',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Account"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  'assets/icon_profile.svg',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
        currentIndex: controller.navigatorIndex,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 10,
        selectedItemColor: Colors.black,
        backgroundColor: Color(0xFFEFEFEF),
      ),
    );
  }
}
