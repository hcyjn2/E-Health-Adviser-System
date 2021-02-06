import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Text buttonText;
  final Function buttonAction;
  final Color buttonColor;
  final Color rippleColor;

  BottomButton(
      {@required this.buttonText,
      @required this.buttonAction,
      @required this.buttonColor,
      @required this.rippleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Ink(
        height: 75,
        width: double.infinity,
        color: buttonColor,
        child: InkWell(
          splashColor: rippleColor,
          onTap: buttonAction,
          child: Center(child: buttonText),
        ),
      ),
    );
  }
}
