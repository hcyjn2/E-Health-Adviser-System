import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';

import '../../constants.dart';

class ResultPage extends StatefulWidget {
  final String resultPhrase;
  final int resultScore;
  final Tests testType;
  final List<Widget> body;
  final String advices;

  ResultPage({
    Key key,
    @required this.resultPhrase,
    @required this.resultScore,
    @required this.testType,
    this.advices = '',
    this.body = null,
  })  : assert(resultPhrase != null),
        assert(resultScore != null),
        assert(testType != null),
        super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> with MenuFunction {
  @override
  Widget build(BuildContext context) {
    return SwipeableWidget(
      height: double.infinity,
      onSwipeCallback: () {
        returnBack(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(widget.testType.testType + " Test Results",
                      textAlign: TextAlign.center,
                      style: kThickFont.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Text(
                "Your score is",
                style: kThickFont.copyWith(
                    fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.resultScore.toString(),
                style: kThickFont.copyWith(fontSize: 60, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    widget.resultPhrase,
                    textAlign: TextAlign.left,
                    style: kThickFont.copyWith(
                      fontSize: 28,
                      color: Colors.indigo[900],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 0.0,
                ),
                child: Text(
                  'General tips on ' + widget.testType.testType + ' issues:',
                  style: kThickFont.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    widget.advices,
                    textAlign: TextAlign.left,
                    style: kThickFont.copyWith(
                      fontSize: 28,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
