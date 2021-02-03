import 'package:flutter/material.dart';
import 'package:main_menu/components/TextField.dart';
import 'package:main_menu/constants.dart';

class LoginPWField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const LoginPWField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
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
          suffixIcon: Icon(Icons.visibility, 
              color:kPrimaryLightColor,
              ),
          ),
    ),
    );
  }
}
