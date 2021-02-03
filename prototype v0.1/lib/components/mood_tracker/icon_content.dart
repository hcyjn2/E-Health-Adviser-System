import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color labelColor;

  IconContent(this.icon, this.label, this.labelColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color(0xFF333333),
          size: 250,
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          label,
          style: kLabelTextStyle.copyWith(color: labelColor),
        ),
        SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
