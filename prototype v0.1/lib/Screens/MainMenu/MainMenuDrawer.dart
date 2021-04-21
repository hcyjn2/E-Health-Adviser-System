import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MainMenuDrawer extends StatefulWidget {
  @override
  _MainMenuDrawerState createState() => _MainMenuDrawerState();
}

class _MainMenuDrawerState extends State<MainMenuDrawer> {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF99d8e8)),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  //image used is a temporary placeholder image
                  backgroundImage: AssetImage('Images/cat21.png'),
                ),
                Text(
                  'Insert Name Here',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              print("Go into setting");
            },
          ),
          ListTile(
              leading: Icon(Icons.all_inbox_rounded),
              title: Text('Resources'),
              onTap: () {
                print("go to resources");
              }),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout'),
              onTap: () => _signOutButtonOnPressed(),
          ),
        ],
      ),
    );
  }
}
