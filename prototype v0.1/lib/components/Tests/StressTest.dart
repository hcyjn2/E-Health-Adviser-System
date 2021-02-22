import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Tests/ResultPage.dart';
import 'package:main_menu/Screens/Tests/TestQuestionPage.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/Tests/StressAdvices.dart';
import 'package:main_menu/components/Tests/StressTestResult.dart';

import 'TestEnums.dart';

class StressTest extends StatefulWidget {
  final int questionCount = 13;
  StressTestState createState() => StressTestState();
}

class StressTestState extends State<StressTest> with MenuFunction {
  ///Represents current answer for the question selected through radio button (by default selected none)
  StressTestAnswer testAnswerChosen;

  ///Set of stress questions
  List<String> stressQuestions = [];

  ///Set of stress answers
  List<StressTestAnswer> answers = [];

  ///Question counter
  int questionCounter = 0;

  ///Total Score
  int totalScore = 0;

  @override
  initState() {
    super.initState();
    stressQuestions
        .add('Found yourself getting upset by quite trivial things?');
    stressQuestions.add('Tended to over-react to situations?');
    stressQuestions.add('Found it difficult to relax?');
    stressQuestions.add('Felt that you were using a lot of nervous energy?');
    stressQuestions.add(
        'Found yourself getting impatient when you were delayed in any way (eg, lifts, traffic lights, being kept waiting)?');
    stressQuestions.add('Felt that you were rather touchy?');
    stressQuestions.add('Found it hard to wind down?');
    stressQuestions.add('Found yourself being very irritable?');
    stressQuestions.add('Found it hard to calm down after something upset you');
    stressQuestions.add(
        'Found it difficult to tolerate interruptions to what you were doing?');
    stressQuestions.add('Were in a state of nervous tension?');
    stressQuestions.add(
        'Were intolerant of anything that kept you from getting on with what you were doing?');
    stressQuestions.add('Found yourself getting agitated?');
    testAnswerChosen = StressTestAnswer.None;

    questionCounter = 0;
  }

  setSelectedStressAnswer(StressTestAnswer value) {
    print("Stress Test answer $value is chosen");
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
        testAnswerChosen = StressTestAnswer.None;
        questionCounter++;
      });
    } else {
      StressTestResult results = StressTestResult(
        resultScore: totalScore,
      );
      StressAdvices stressAdvices = StressAdvices();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ResultPage(
                    testType: Tests.Stress,
                    resultScore: totalScore /
                        (widget.questionCount *
                            StressTestAnswerExtension.maxScore()),
                    resultPhrase: results.result.name,
                    resultColor: results.result.color,
                    advices: stressAdvices.getAdvices(5),
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
        question: stressQuestions[questionCounter],
        answerChoices: <Widget>[
          RadioListTile(
            value: StressTestAnswer.NotAtAll,
            groupValue: testAnswerChosen,
            title: Text(StressTestAnswer.NotAtAll.name),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.SeveralDays,
            groupValue: testAnswerChosen,
            title: Text(StressTestAnswer.SeveralDays.name),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.OverHalfTheDays,
            groupValue: testAnswerChosen,
            title: Text(StressTestAnswer.OverHalfTheDays.name),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.NearlyEveryday,
            groupValue: testAnswerChosen,
            title: Text(StressTestAnswer.NearlyEveryday.name),
            onChanged: (value) {
              setSelectedStressAnswer(value);
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
