import 'package:flutter/material.dart';

class LoginBG extends StatelessWidget {
  final Widget child;
  const LoginBG({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
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
