import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({
    Key key,
  }) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: ('Email'),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    color: kPrimaryLightColor,
                    child: Text('Click here to reset!',
                    style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'DejaVuSerif',
              fontWeight: FontWeight.bold,
            ),
            ),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: _email);
                      Navigator.of(context).pop();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'A reset link has been sent to your email.\n Please check your email.',
             textAlign: TextAlign.center,
              style: TextStyle(
            fontSize: 15,
            fontFamily: 'DejaVuSerif',
            fontWeight: FontWeight.bold
          ),
            ),
          );
        });
                    },
                    ),
                ],
                ),
        ],
              ),
    );

  }}
