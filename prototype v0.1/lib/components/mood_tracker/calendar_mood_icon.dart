import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoodIcon extends StatelessWidget {
  final IconData moodIcon;
  final Color color;

  MoodIcon({@required this.moodIcon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.transparent
          // borderRadius: BorderRadius.all(Radius.circular(1200)),
          // border: Border.all(color: Colors.blue, width: 1.0),
          ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: new Icon(
          moodIcon,
          color: color,
          size: 30,
        ),
      ),
    );
    ;
  }
}
