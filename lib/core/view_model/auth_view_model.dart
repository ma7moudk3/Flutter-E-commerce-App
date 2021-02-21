import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce_app/view/home_screen.dart';
import 'package:ecommerce_app/model/user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;

  Rx<User> _user;
  get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth
        .signInWithCredential(credential)
        .then((value) => saveUser(value));
  }

  void signInWithFacebook() async {
    var result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken);
      await _auth
          .signInWithCredential(facebookAuthCredential)
          .then((value) => saveUser(value));
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.message);
    }
  }

  void registerWithEmailAndPassword() async {
    try {
      final _auth = FirebaseAuth.instance;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        saveUser(value);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar('Error', e.message);
    }
  }

  void saveUser(UserCredential value) async {
    UserModel user = UserModel(
        userId: value.user.uid,
        email: value.user.email,
        name: name,
        picture: '');
    await FireStoreUser().addUserToFireStore(user);
  }
}
