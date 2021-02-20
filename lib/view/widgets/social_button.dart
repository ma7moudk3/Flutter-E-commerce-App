import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String logo;
  final String text;
  final Function onPressed;
  const SocialButton({Key key, this.logo, this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FlatButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(
                'assets/$logo',
                width: 25,
              ),
              SizedBox(
                width: 60,
              ),
              CustomText(
                alignment: Alignment.center,
                text: text,
              ),
            ],
          )),
    );
  }
}
