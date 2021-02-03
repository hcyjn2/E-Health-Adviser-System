import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Text buttonText;
  final Function buttonAction;
  final Color containerColor;

  BottomButton(
      {@required this.buttonText,
      @required this.buttonAction,
      @required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        child: Center(child: buttonText),
        height: 75,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(2.5)),
      ),
    );
  }
}
