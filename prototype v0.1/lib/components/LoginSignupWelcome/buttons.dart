import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

class LoginSignUpButtons extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const LoginSignUpButtons({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryLightColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontFamily: 'DejaVuSerif',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
