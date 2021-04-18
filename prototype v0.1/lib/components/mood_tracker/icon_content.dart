import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color labelColor;
  final double iconSize;
  final Color iconColor;
  final double breakHeight;

  IconContent({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.labelColor,
    this.iconSize = 250,
    this.iconColor = defaultIconColor,
    this.breakHeight = 25.0,
  })  : assert(icon != null),
        assert(label != null && label != ''),
        assert(labelColor != null),
        assert(iconSize > 0),
        assert(breakHeight > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(
          height: breakHeight,
        ),
        Text(
          label,
          style: kLabelTextStyle.copyWith(color: labelColor),
        ),
        SizedBox(
          height: breakHeight,
        ),
      ],
    );
  }
}
