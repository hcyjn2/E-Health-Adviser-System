import 'package:flutter/material.dart';
import 'package:main_menu/components/TextField.dart';

class LoginInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>
  onChanged;
  const LoginInputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      child:TextField(
        onChanged: onChanged,
        decoration: InputDecoration(       
            hintText: hintText,
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