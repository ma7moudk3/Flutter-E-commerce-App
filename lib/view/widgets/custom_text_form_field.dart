import 'dart:ui';

import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final void Function(String) validator;
  final void Function(String) onSaved;
  final TextInputType keyboardType;
  final bool secureText;
  const CustomTextFormField(
      {Key key,
      this.text = "text",
      this.hint = "hint",
      this.validator,
      this.onSaved,
      this.keyboardType = TextInputType.text,
      this.secureText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            textColor: Colors.grey.shade700,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: secureText,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
