import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Advice extends StatelessWidget {
  final String header;
  final String text;
  final Color headerColor;
  final Color textColor;

  Advice({
    Key key,
    @required this.header,
    @required this.text,
    this.headerColor = Colors.black,
    this.textColor = Colors.green,
  })  : assert(header != null && header != ''),
        assert(text != null && text != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            header,
            textAlign: TextAlign.left,
            style: kThickFont.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: headerColor,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.left,
          style: kThickFont.copyWith(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
