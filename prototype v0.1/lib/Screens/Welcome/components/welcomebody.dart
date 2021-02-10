import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Login/loginscreen.dart';
import 'package:main_menu/Screens/SignUp/signupscreen.dart';
import 'package:main_menu/Screens/Welcome/components/welcomebg.dart';
import 'package:main_menu/components/buttons.dart';
import 'package:main_menu/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "WELCOME!",
              style: const TextStyle(
                fontFamily: 'DejaVuSerif',
                fontWeight: FontWeight.w300,
                fontSize: 39,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "How may we heal you?",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'DejaVuSerif',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            LoginSignUpButtons(
              text: "LOGIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            LoginSignUpButtons(
              text: "SIGN UP",
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
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
