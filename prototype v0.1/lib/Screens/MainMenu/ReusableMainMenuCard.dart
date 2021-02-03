import 'package:flutter/material.dart';

class ReusableMainMenuCard extends StatelessWidget {
  ReusableMainMenuCard({@required this.mainMenuCard});

  final Widget mainMenuCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mainMenuCard,
      decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 100.0,
      width: 350.0,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
    );
  }
}