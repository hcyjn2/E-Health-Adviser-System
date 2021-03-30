import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/components/EmailField.dart';
import 'package:flutter_firebase_login_example/components/LoginCheckAcc.dart';
import 'package:flutter_firebase_login_example/components/PasswordField.dart';
import 'package:flutter_firebase_login_example/components/buttons.dart';
import 'package:flutter_firebase_login_example/components/forgotpw.dart';
import 'package:flutter_firebase_login_example/screens/Login/components/loginbg.dart';
import 'package:flutter_firebase_login_example/screens/SignUp/signupscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      Fluttertoast.showToast(msg: "Kindly fill in your password/username");
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
          SizedBox(height: 10),
          ForgotPWButton(
            press: () {},
          ),
        ],
      ),
    );
  }
}
