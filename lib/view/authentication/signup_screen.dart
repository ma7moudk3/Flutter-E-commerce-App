import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/authentication/login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
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
                CustomText(
                  text: 'SignUp',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Rigister your new account',
                  fontSize: 14,
                  textColor: Colors.grey,
                ),
                SizedBox(
                  height: screenHight * 0.06,
                ),
                CustomTextFormField(
                  text: "Name",
                  keyboardType: TextInputType.emailAddress,
                  hint: "Ex. Malek hamada",
                  onSaved: (val) {
                    controller.name = val;
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
                  height: screenHight * 0.08,
                ),
                PrimaryButton(
                  text: "SignUp",
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      controller.registerWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
