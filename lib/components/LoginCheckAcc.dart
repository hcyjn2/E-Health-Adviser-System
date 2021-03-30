import 'package:flutter/material.dart';

class LoginCheckAccount extends StatelessWidget {
  final Function press;
  final bool login;

  const LoginCheckAccount({
    Key key,
    this.press,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? "Don't have an account? Register with us!"
                : "Already have an account? Login with us!",
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
