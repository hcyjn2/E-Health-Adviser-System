import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/components/EmailField.dart';
import 'package:flutter_firebase_login_example/components/LoginCheckAcc.dart';
import 'package:flutter_firebase_login_example/components/PasswordField.dart';
import 'package:flutter_firebase_login_example/components/ReenterPWField.dart';
import 'package:flutter_firebase_login_example/components/buttons.dart';
import 'package:flutter_firebase_login_example/screens/Login/loginscreen.dart';
import 'package:flutter_firebase_login_example/screens/SignUp/components/signupbg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpBody extends StatefulWidget {
  final Widget child;

  const SignUpBody({Key key, @required this.child}) : super(key: key);

  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String _email;
  String _password;
  String _reEnterPassword;

  void _signUpButtonOnPressed() {
    if (_email != null && _email != "") {
      if (_password == _reEnterPassword) {
        _handleFirebaseRegister();
      } else {
        Fluttertoast.showToast(
            msg: "password must be same with re-enter password");
      }
    } else {
      Fluttertoast.showToast(msg: "email cant be empty");
    }
  }

  void _handleFirebaseRegister() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      Fluttertoast.showToast(msg: "You have registered!");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpBG(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginInputField(
              hintText: "Enter your email",
              onChanged: (value) {
                _email = value;
              },
            ),
            LoginPWField(
              onChanged: (value) {
                _password = value;
              },
            ),
            ReenterPWField(
              onChanged: (value) {
                _reEnterPassword = value;
              },
            ),
            SizedBox(height: 8),
            LoginSignUpButtons(
              text: "SIGN UP",
              press: () => _signUpButtonOnPressed(),
            ),
            SizedBox(height: 13),
            LoginCheckAccount(
              login: false,
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
          ],
        ),
      ),
    );
  }
}
