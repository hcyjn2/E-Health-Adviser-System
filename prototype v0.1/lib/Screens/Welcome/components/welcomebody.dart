import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main_menu/components/buttons.dart';
import 'package:main_menu/constants.dart';
import 'package:main_menu/screens/Login/loginscreen.dart';
import 'package:main_menu/screens/SignUp/signupscreen.dart';
import 'package:main_menu/screens/Welcome/components/welcomebg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      checkUserStatus();
    } catch (e) {
      print("unable to setup");
      Fluttertoast.showToast(msg: "unable to setup firebase");
    }
  }

  void checkUserStatus() {
    //check user status
    //if logged in then navigate

    User currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Navigator.pushReplacementNamed(context, '/mainmenu');
    }
  }

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
