import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Login/components/loginbg.dart';
import 'package:main_menu/Screens/MainMenu/MainMenuScreen.dart';
import 'package:main_menu/Screens/SignUp/signupscreen.dart';
import 'package:main_menu/components/EmailField.dart';
import 'package:main_menu/components/buttons.dart';
import 'package:main_menu/components/PasswordField.dart';
import 'package:main_menu/components/LoginCheckAcc.dart';
import 'package:main_menu/components/forgotpw.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginBG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 3),
          LoginInputField(
            hintText: "Email",
            onChanged: (value) {},
          ),
          LoginPWField(
            onChanged: (value) {},
          ),
          SizedBox(height: 15),
          LoginSignUpButtons(
            text: "LOGIN",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainMenuScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 15),
          LoginCheckAccount(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 10),
          ForgotPWButton(
            press: () {},
          ),
        ],
      ),
    );
  }
}
