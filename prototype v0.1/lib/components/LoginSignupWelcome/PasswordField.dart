import 'package:flutter/material.dart';
import 'package:main_menu/components/LoginSignupWelcome/TextField.dart';

class LoginPWField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const LoginPWField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _LoginPWFieldState createState() => _LoginPWFieldState();
}

class _LoginPWFieldState extends State<LoginPWField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      child: TextFormField(
        obscureText: _isHidden,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Password",
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
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              !_isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
