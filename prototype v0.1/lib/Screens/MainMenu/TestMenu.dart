import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/AnxietyTest.dart';
import 'package:main_menu/components/Tests/StressTest.dart';
import 'package:main_menu/constants.dart';

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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Images/testmenubackground.png'),
                  fit: BoxFit.cover)),
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
                    topMargin: 27,
                    assetImage: Image.asset('null'),
                    buttonText: Text('Stress Diagnose',
                        style: kThickFont.copyWith(fontSize: 32)),
                    onTap: () {
                      stressTest(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AnimatedButton(
                    topMargin: 27,
                    assetImage: Image.asset('null'),
                    buttonText: Text('Anxiety Diagnose',
                        style: kThickFont.copyWith(fontSize: 32)),
                    onTap: () {
                      anxietyTest(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
