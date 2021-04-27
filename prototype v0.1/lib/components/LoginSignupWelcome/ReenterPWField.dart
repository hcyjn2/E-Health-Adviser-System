import 'package:flutter/material.dart';
import 'package:main_menu/components/LoginSignupWelcome/TextField.dart';

class ReenterPWField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ReenterPWField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _ReenterPWFieldState createState() => _ReenterPWFieldState();
}

class _ReenterPWFieldState extends State<ReenterPWField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: _isHidden,
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
