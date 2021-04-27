import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/Screens/ForgetPassword/forgotpw.dart';
import 'package:main_menu/components/LoginSignupWelcome/EmailField.dart';
import 'package:main_menu/screens/Login/components/loginbg.dart';
import 'package:main_menu/screens/SignUp/signupscreen.dart';

import 'file:///C:/DevTools/E-Health-Adviser-System/prototype%20v0.1/lib/components/LoginSignupWelcome/LoginCheckAcc.dart';
import 'file:///C:/DevTools/E-Health-Adviser-System/prototype%20v0.1/lib/components/LoginSignupWelcome/PasswordField.dart';
import 'file:///C:/DevTools/E-Health-Adviser-System/prototype%20v0.1/lib/components/LoginSignupWelcome/buttons.dart';

class LoginBody extends StatefulWidget {
  LoginBody({
    Key key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String _email;
  String _password;

  void _loginButtonOnPressed() async {
    if (_email != null && _password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        if (userCredential != null) {
          Navigator.pushReplacementNamed(context, '/mainmenu');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'No user found for that email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'DejaVuSerif',
                          fontWeight: FontWeight.normal),
                    ),
                  );
                });
          }
        } else if (e.code == 'wrong-password') {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Invalid email/password. \n Kindly try again! :)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'DejaVuSerif',
                        fontWeight: FontWeight.normal),
                  ),
                );
              });
        }
      }
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Invalid email/password.\n Please try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'DejaVuSerif',
                    fontWeight: FontWeight.normal),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginBG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 3),
          LoginInputField(
            hintText: "Email",
            onChanged: (value) {
              _email = value;
            },
          ),
          LoginPWField(
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 15),
          LoginSignUpButtons(
            text: "LOGIN",
            press: _loginButtonOnPressed,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'Forgot Password?',
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'DejaVuSerif',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
