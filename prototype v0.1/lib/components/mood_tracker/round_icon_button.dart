import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function buttonAction;
  final double size;
  final double elevation;
  final Color btnColor;

  RoundIconButton({
    Key key,
    @required this.icon,
    @required this.buttonAction,
    this.size = 56.0,
    this.elevation = 6.0,
    this.btnColor = defaultRoundIconBtnColor,
  })  : assert(icon != null),
        assert(buttonAction != null),
        assert(size > 0),
        assert(elevation >= 0),
        assert(btnColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: buttonAction,
      constraints: BoxConstraints.tightFor(
        width: size,
        height: size,
      ),
      shape: CircleBorder(),
      elevation: elevation,
      fillColor: btnColor,
    );
  }
}
