import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/components/EmailField.dart';
import 'package:main_menu/components/LoginCheckAcc.dart';
import 'package:main_menu/components/PasswordField.dart';
import 'package:main_menu/components/ReenterPWField.dart';
import 'package:main_menu/components/buttons.dart';
import 'package:main_menu/screens/Login/loginscreen.dart';
import 'package:main_menu/screens/SignUp/components/signupbg.dart';
import 'package:main_menu/signupcomplete.dart';

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

  void _signUpButtonOnPressed() async {
    if (_email != null && _email != "") {
      if (_password == _reEnterPassword) {
        _handleFirebaseRegister();
      } else {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'The passwords do not match.\n Please try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
            fontSize: 18,
            fontFamily: 'DejaVuSerif',
            fontWeight: FontWeight.normal
          ),
            ),
          );
        });
  }
    } else  {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
             'Email cannot be empty.\n Please try again.',
             textAlign: TextAlign.center,
              style: TextStyle(
            fontSize: 18,
            fontFamily: 'DejaVuSerif',
            fontWeight: FontWeight.normal
          ),
            ),
          );
        });
    }
  }

    void _handleFirebaseRegister() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      if (userCredential != null) {
        await _showRegisterSuccessDialog();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpComplete()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Your password is too weak.\n Please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'DejaVuSerif',
                      fontWeight: FontWeight.normal),
                ),
              );
            });
      } else if (e.code == 'email-already-in-use') {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'The email is already in use.\n Please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'DejaVuSerif',
                      fontWeight: FontWeight.normal),
                ),
              );
            });
      }
    } catch (e) {
      print(e);
    }
  }
  _showRegisterSuccessDialog() async {
    {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'You have successfully registered with us.\n Thank you!',
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
