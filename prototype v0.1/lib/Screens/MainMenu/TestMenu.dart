import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/AnxietyTest.dart';
import 'package:main_menu/components/Tests/StressTest.dart';

import 'AnimatedButton.dart';

class TestMenu extends StatelessWidget with MenuFunction {
  void stressTest(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StressTest()));
  }

  void anxietyTest(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AnxietyTest()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SwipeableWidget(
          height: double.infinity,
          onSwipeCallback: () {
            returnBack(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: AnimatedButton(
                  textDisplayed: 'Stress Test',
                  onTap: () {
                    stressTest(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: AnimatedButton(
                  textDisplayed: 'Anxiety Test',
                  onTap: () {
                    anxietyTest(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
