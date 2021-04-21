import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

class SignUpComplete extends StatefulWidget {
  @override
  _SignUpCompleteState createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  void _signOutButtonOnPressed() async {
    await FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser==null){
      //if user logged out then back to main page
      //back to first page
            Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Complete"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
          ),
          Center(child: Text("Your registration is complete.\n You may click on the button below to login and enjoy our app.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'DejaVuSerif',
              fontWeight: FontWeight.normal,
            ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: GestureDetector(
              onTap: () => _signOutButtonOnPressed(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(0)),
                child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),           
                child: Center(
                      child: Text(
                    "Back to Login",
                    style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'DejaVuSerif',
              fontWeight: FontWeight.w600,
            ),
                  ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
