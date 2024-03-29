import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommerce_app/helper/binding.dart';
import 'view/controller_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEFEFEF),
        primaryColor: Color(0XFF00C569),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: ControllerView(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (ctx, snapshot) {
      //     if (snapshot.hasData) {
      //       return HomeScreen();
      //     } else {
      //       return LoginScreen();
      //     }
      //   },
      // ),
      // home: Obx(() => (Get.find<AuthViewModel>().user != null)
      //     ? HomeScreen()
      //     : LoginScreen()),
    );
  }
}
