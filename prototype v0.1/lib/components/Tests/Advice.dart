import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

//This class is used to describe mental health advices.
//Every advice has a header and the body. Additionally you may adjust the color of both parts
class Advice extends StatelessWidget {
  /// This parameter is used to store advice's header
  final String header;

  /// This parameter is sued to store advice's body
  final String text;

  /// This parameter can be used to customize headers color. Default is black.
  final Color headerColor;

  /// This parameter can be used to customize the color of the body. Default is green.
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
