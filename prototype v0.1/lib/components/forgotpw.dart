import 'package:flutter/material.dart';

class ForgotPWButton extends StatelessWidget {
  final Function press;
  const ForgotPWButton({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            "Forgot password?",
            style: const TextStyle(
            fontSize: 15,
            fontFamily: 'DejaVuSerif',
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
            ),
        ),
          ],
          );
  }
}

