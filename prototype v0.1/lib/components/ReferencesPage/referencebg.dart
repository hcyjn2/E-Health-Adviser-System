import 'package:flutter/material.dart';

class ReferenceBG extends StatelessWidget {
  final Widget child;
  const ReferenceBG({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 3,
            left: 0,
            child: Image.asset(
              "assets/Images/topleft.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -10,
            child: Image.asset(
              "assets/Images/bottomright.png",
              width: size.width * 0.36,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
