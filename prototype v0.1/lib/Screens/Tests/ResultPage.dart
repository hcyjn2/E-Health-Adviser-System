import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/components/Tests/Advice.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';
import 'package:main_menu/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ResultPage extends StatefulWidget {
  /// This parameter stores level of severity of the results
  final String resultPhrase;

  /// This parameter stores the score of the results obtained
  final double resultScore;

  /// This parameter holds the name of the test, for which results are displayed
  final Tests testType;

  /// This parameter stores extra widgets to be displayed at the end of the results, if specified.
  final List<Widget> body;

  /// This parameter stores list of advices on how to keep healthy mental state
  final List<Advice> advices;

  /// This parameter stores the color that identifies the results severity
  final Color resultColor;

  /// This parameter stores brief explanation and suggestions for the results obtained
  final Text resultExplanation;

  ResultPage({
    Key key,
    @required this.resultPhrase,
    @required this.resultScore,
    @required this.testType,
    @required this.resultColor,
    @required this.resultExplanation,
    this.advices = null,
    this.body = null,
  })  : assert(resultPhrase != null),
        assert(resultScore != null && resultScore >= 0),
        assert(testType != null),
        assert(resultColor != null),
        assert(resultPhrase != null),
        super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> with MenuFunction {
  @override
  Widget build(BuildContext context) {
    //This widget allows to return back to menu on swipe to the right
    return SwipeablePageWidget(
      onSwipeCallback: () {
        returnBack(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              //Displaying the test type
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
              //Displaying color bar that shows your results severity
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
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
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
                  horizontal: 20.0,
                ),
                child: Text(
                  'Test results explanation',
                  style: kThickFont.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              //Displaying test results explanation in the scrollable box
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    children: <Widget>[widget.resultExplanation],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'General tips on ' + widget.testType.testType + ' issues:',
                  style: kThickFont.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              //Displaying advices on keeping healthy mental state in the scrollable box
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: widget.advices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return widget.advices[index];
                      }),
                ),
              ),
              widget.body != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: widget.body,
                    )
                  : SizedBox(
                      height: 10,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
