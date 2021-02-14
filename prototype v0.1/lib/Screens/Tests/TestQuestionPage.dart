import 'package:flutter/material.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';
import 'package:main_menu/constants.dart';

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

  final int questionNumber;

  TestQuestionPage({
    Key key,
    @required this.question,
    @required this.answerChoices,
    @required this.onAction,
    @required this.header,
    @required this.questionNumber,
    this.questionPrefix = 'In the LAST MONTH, how often have you:',
  })  : assert(question != null),
        assert(answerChoices != null),
        assert(onAction != null),
        assert(questionNumber != null && questionNumber > 0),
        assert(header != null),
        super(key: key);

  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(header,
                    textAlign: TextAlign.center,
                    style: kThickFont.copyWith(fontSize: 40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Question ' + questionNumber.toString() + '.',
                  textAlign: TextAlign.left,
                  style: kThickFont.copyWith(fontSize: 20)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    questionPrefix,
                    textAlign: TextAlign.left,
                    style: kThickFont.copyWith(fontSize: 20),
                  ),
                ),
                Container(
                  height: 85,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(question,
                        textAlign: TextAlign.left,
                        style: kThickFont.copyWith(
                            fontSize: 16, color: Colors.indigo[900])),
                  ),
                ),
                Column(
                  children: answerChoices,
                ),
                BottomButton(
                  buttonText: Text(
                    'NEXT',
                    style: kThickFont.copyWith(fontSize: 30),
                  ),
                  buttonAction: onAction,
                  buttonColor: Colors.lightBlueAccent[100],
                  rippleColor: Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Align(
// alignment: Alignment.bottomCenter,
// child: Padding(
// padding: EdgeInsets.all(10.0),
// child: RaisedButton(
// child: SizedBox(
// width: double.infinity,
// child: Text(
// 'Next',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 22.0,
// color: Colors.black,
// ),
// ),
// ),
// onPressed: onAction,
// ),
// ),
// ),
