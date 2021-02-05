import 'package:flutter/material.dart';

mixin MenuFunction {
  void returnBack(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/mainmenu'));
  }
}
