import 'package:flutter/material.dart';

class MainMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
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
              onTap: () {
                print("User have logged out");
              }),
        ],
      ),
    );
  }
}
