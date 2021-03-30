import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
        title: Text("User Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
          ),
          Center(child: Text("You had logged in fire base !")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: GestureDetector(
              onTap: () => _signOutButtonOnPressed(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                      child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
