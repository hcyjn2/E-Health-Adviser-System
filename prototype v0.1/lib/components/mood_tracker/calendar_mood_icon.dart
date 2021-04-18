import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  final IconData moodIcon;
  final Color color;
  final double size;

  MoodIcon({
    Key key,
    @required this.moodIcon,
    @required this.color,
    this.size = 30,
  })  : assert(moodIcon != null),
        assert(color != null),
        assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.transparent,
        // borderRadius: BorderRadius.all(Radius.circular(1200)),
        // border: Border.all(color: Colors.blue, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: new Icon(
          moodIcon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
