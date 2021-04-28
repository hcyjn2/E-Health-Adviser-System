import 'package:flutter/material.dart';

mixin MenuFunction {
  //Returning back to main menu
  void returnBack(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/mainmenu'));
  }
}
