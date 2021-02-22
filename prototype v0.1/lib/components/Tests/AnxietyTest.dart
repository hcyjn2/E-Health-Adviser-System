import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Tests/ResultPage.dart';
import 'package:main_menu/Screens/Tests/TestQuestionPage.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/AnxietyTestResult.dart';

import 'AnxietyAdvices.dart';
import 'TestEnums.dart';

class AnxietyTest extends StatefulWidget {
  final int questionCount = 7;
  AnxietyTestState createState() => AnxietyTestState();
}

class AnxietyTestState extends State<AnxietyTest> with MenuFunction {
  ///Represents current answer for the question selected through radio button (by default selected none)
  AnxietyTestAnswer testAnswerChosen;

  ///Set of anxiety questions
  List<String> anxietyQuestions = [];

  ///Set of anxiety answers
  List<AnxietyTestAnswer> answers = [];

  ///Question counter
  int questionCounter = 0;

  ///Total Score
  int totalScore = 0;

  @override
  initState() {
    super.initState();
    anxietyQuestions.add('Feeling nervous, anxious, or on edge?');
    anxietyQuestions.add('Not being able to stop or control worrying?');
    anxietyQuestions.add('Worrying too much about different things?');
    anxietyQuestions.add('Trouble relaxing?');
    anxietyQuestions.add('Being so restless that it’s hard to sit still?');
    anxietyQuestions.add('Becoming easily annoyed or irritable?');
    anxietyQuestions.add('Feeling afraid as if something awful might happen?');

    testAnswerChosen = AnxietyTestAnswer.None;

    questionCounter = 0;
  }

  setSelectedAnxietyAnswer(AnxietyTestAnswer value) {
    print("Anxiety Test answer $value is chosen");
    setState(() {
      testAnswerChosen = value;
    });
  }

  nextQuestion() {
    print('Next pressed');
    answers.add(testAnswerChosen);
    totalScore += testAnswerChosen.points;
    if (questionCounter + 1 < widget.questionCount) {
      setState(() {
        testAnswerChosen = AnxietyTestAnswer.None;
        questionCounter++;
      });
    } else {
      AnxietyTestResult results = AnxietyTestResult(resultScore: totalScore);
      AnxietyAdvices anxietyAdvices = AnxietyAdvices();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ResultPage(
                    testType: Tests.Anxiety,
                    resultScore: totalScore /
                        (widget.questionCount *
                            StressTestAnswerExtension.maxScore()),
                    resultPhrase: results.result.name,
                    resultColor: results.result.color,
                    advices: anxietyAdvices.getAdvices(5),
                  )));
    }
  }

  Widget build(BuildContext context) {
    return SwipeableWidget(
      height: double.infinity,
      onSwipeCallback: () {
        returnBack(context);
      },
      child: TestQuestionPage(
        questionNumber: questionCounter + 1,
        question: anxietyQuestions[questionCounter],
        answerChoices: <Widget>[
          RadioListTile(
            value: AnxietyTestAnswer.NotAtAll,
            groupValue: testAnswerChosen,
            title: Text(AnxietyTestAnswer.NotAtAll.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.SeveralDays,
            groupValue: testAnswerChosen,
            title: Text(AnxietyTestAnswer.SeveralDays.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.OverHalfTheDays,
            groupValue: testAnswerChosen,
            title: Text(AnxietyTestAnswer.OverHalfTheDays.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.NearlyEveryday,
            groupValue: testAnswerChosen,
            title: Text(AnxietyTestAnswer.NearlyEveryday.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
        ],
        onAction: nextQuestion,
        header: 'Simply answer next ' +
            widget.questionCount.toString() +
            ' questions',
      ),
    );
  }
}
