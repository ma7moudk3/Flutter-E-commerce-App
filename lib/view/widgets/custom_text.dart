import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final Alignment alignment;
  const CustomText(
      {Key key,
      this.text = "",
      this.fontSize = 16,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.alignment = Alignment.topLeft})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: GoogleFonts.notoSans(
            textStyle: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        )),
      ),
    );
  }
}
