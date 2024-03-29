import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/primary_button.dart';
import 'package:ecommerce_app/view/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/authentication/signup_screen.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: CustomText(
                        text: 'Sign Up',
                        fontSize: 18,
                        textColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  textColor: Colors.grey,
                ),
                SizedBox(
                  height: screenHight * 0.06,
                ),
                CustomTextFormField(
                  text: "Email",
                  keyboardType: TextInputType.emailAddress,
                  hint: "example@ex.com",
                  onSaved: (val) {
                    controller.email = val;
                  },
                  validator: (val) {
                    if (val == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: screenHight * 0.04,
                ),
                CustomTextFormField(
                  text: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  secureText: true,
                  hint: "●●●●●●●●●●●●",
                  onSaved: (val) {
                    controller.password = val;
                  },
                  validator: (val) {
                    if (val == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: screenHight * 0.03,
                ),
                CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  textColor: Colors.grey,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: screenHight * 0.04,
                ),
                PrimaryButton(
                  text: "LOGIN",
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: screenHight * 0.04,
                ),
                CustomText(
                  text: '- OR -',
                  fontSize: 18,
                  textColor: Colors.black87,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: screenHight * 0.04,
                ),
                SocialButton(
                  logo: 'facebook_icon.png',
                  text: 'Sign In with Facebook',
                  onPressed: () {
                    controller.signInWithFacebook();
                  },
                ),
                SizedBox(
                  height: screenHight * 0.02,
                ),
                SocialButton(
                  logo: 'google_icon.png',
                  text: 'Sign In with Google',
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
