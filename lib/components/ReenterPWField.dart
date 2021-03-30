import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/components/TextField.dart';

class ReenterPWField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const ReenterPWField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      child: TextFormField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Re-enter your password",
          hintStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'DejaVuSerif',
            fontWeight: FontWeight.w300,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
