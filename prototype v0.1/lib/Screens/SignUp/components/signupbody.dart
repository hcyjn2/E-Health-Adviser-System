import 'package:flutter/material.dart';
import 'package:main_menu/Screens/SignUp/components/signupbg.dart';
import 'package:main_menu/components/EmailField.dart';
import 'package:main_menu/components/LoginCheckAcc.dart';
import 'package:main_menu/components/PasswordField.dart';
import 'package:main_menu/components/ReenterPWField.dart';
import 'package:main_menu/components/buttons.dart';
import 'package:main_menu/Screens/Login/loginscreen.dart';

class SignUpBody extends StatelessWidget {
  final Widget child;
  const SignUpBody({Key key, @required this.child})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpBG(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginInputField(
          hintText: "Enter your email",
          onChanged: (value) {},
        ),
        LoginPWField(
          onChanged: (value) {},
        ),
        ReenterPWField(
          onChanged: (value) {},
        ),
        SizedBox(height: 8),
        LoginSignUpButtons(
          text: "SIGN UP",
          press: () {},
        ),
        SizedBox(height: 13),
        LoginCheckAccount(
          login: false,
          press: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) {
                return LoginScreen();
              },
              ),
              );
          },
        ),
      ],
    ),
    );
  }
}

