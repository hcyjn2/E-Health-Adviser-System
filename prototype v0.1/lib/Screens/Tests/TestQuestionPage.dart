import 'package:flutter/material.dart';

class TestQuestionPage extends StatelessWidget {
  /// Represents the current question text
  final String question;

  ///Header of the test
  final String header;

  final String questionPrefix;

  ///Represents groups of widgets for the answer choices of test
  final List<Widget> answerChoices;

  ///Function that executes when next button is pressed
  final Function onAction;

  TestQuestionPage({
    Key key,
    @required this.question,
    @required this.answerChoices,
    @required this.onAction,
    @required this.header,
    this.questionPrefix = 'In the LAST MONTH, how often have you:',
  })  : assert(question != null),
        assert(answerChoices != null),
        assert(onAction != null),
        super(key: key);

  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  header,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      questionPrefix,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      question,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
                    children: answerChoices,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onPressed: onAction,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
