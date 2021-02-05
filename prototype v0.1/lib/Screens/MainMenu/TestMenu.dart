import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/AnxietyTest.dart';
import 'package:main_menu/components/Tests/StressTest.dart';

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
    return SafeArea(
      child: SwipeableWidget(
        height: double.infinity,
        onSwipeCallback: () {
          returnBack(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text(
                  'Stress Test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  stressTest(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text(
                  'Anxiety Test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  anxietyTest(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
