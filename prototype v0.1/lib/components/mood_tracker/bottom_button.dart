import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Text buttonText;
  final Function buttonAction;
  final Color buttonColor;
  final Color rippleColor;
  final double height;

  BottomButton({
    Key key,
    @required this.buttonText,
    @required this.buttonAction,
    @required this.buttonColor,
    @required this.rippleColor,
    this.height = 75,
  })  : assert(buttonText != null && buttonText != ''),
        assert(buttonAction != null),
        assert(buttonColor != null),
        assert(rippleColor != null),
        assert(height > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Ink(
        height: height,
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
