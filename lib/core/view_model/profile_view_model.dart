import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  UserModel _user;
  UserModel get user => _user;

  @override
  onInit() {
    super.onInit();
    getCurrentUser();
  }

  getCurrentUser() async {
    await localStorageData.getUserData.then((value) {
      _user = value;
    });
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
