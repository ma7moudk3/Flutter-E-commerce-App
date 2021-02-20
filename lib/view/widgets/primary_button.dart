import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({Key key, @required this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(18),
      color: Theme.of(context).primaryColor,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        textColor: Colors.white,
        fontSize: 14,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
