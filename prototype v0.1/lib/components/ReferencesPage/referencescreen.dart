import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/components/ReferencesPage/referencebody.dart';

class ReferenceScreen extends StatelessWidget with MenuFunction {
  @override
  Widget build(BuildContext context) {
    return SwipeablePageWidget(
      child: Scaffold(
        body: ReferenceBody(),
        resizeToAvoidBottomInset: false, // set it to false
      ),
      onSwipeCallback: () {
        returnBack(context);
      },
    );
  }
}
