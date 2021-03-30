import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Widget child;

  const LoginTextField({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      width: size.width * 0.85,
      child: child,
    );
  }
}
