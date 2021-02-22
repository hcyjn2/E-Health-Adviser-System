import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';

class ResultPage extends StatefulWidget {
  final String resultPhrase;
  final double resultScore;
  final Tests testType;
  final List<Widget> body;
  final Map<String, String> advices;
  final Color resultColor;

  ResultPage({
    Key key,
    @required this.resultPhrase,
    @required this.resultScore,
    @required this.testType,
    @required this.resultColor,
    this.advices = null,
    this.body = null,
  })  : assert(resultPhrase != null),
        assert(resultScore != null && resultScore >= 0),
        assert(testType != null),
        assert(resultColor != null),
        super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> with MenuFunction {
  final List<Widget> _advicesScreen = [];

  @override
  void initState() {
    super.initState();
    widget.advices.forEach((String key, String value) {
      final Widget header = Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          key,
          textAlign: TextAlign.left,
          style: kThickFont.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
      final Widget body = Text(
        value,
        textAlign: TextAlign.left,
        style: kThickFont.copyWith(
          fontSize: 22,
          color: Colors.green,
        ),
      );

      _advicesScreen.add(header);
      _advicesScreen.add(body);
    });
  }

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
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      lineHeight: 40.0,
                      percent:
                          widget.resultScore == 0 ? 0.01 : widget.resultScore,
                      backgroundColor: Colors.grey,
                      progressColor: widget.resultColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 15),
                child: Text(
                  widget.testType.testType + " level: " + widget.resultPhrase,
                  textAlign: TextAlign.left,
                  style: kThickFont.copyWith(
                    fontSize: 22,
                    color: Colors.indigo[900],
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
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: _advicesScreen.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _advicesScreen[index];
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
