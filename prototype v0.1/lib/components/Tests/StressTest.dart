import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Tests/TestQuestionPage.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';

enum StressTestAnswer {
  Never,
  AlmostNever,
  Sometimes,
  FairlyOften,
  VeryOften,
  None,
}

extension StressTestAnswerExtension on StressTestAnswer {
  int get points {
    int points;
    if (this == StressTestAnswer.Never)
      points = 0;
    else if (this == StressTestAnswer.AlmostNever)
      points = 1;
    else if (this == StressTestAnswer.Sometimes)
      points = 2;
    else if (this == StressTestAnswer.FairlyOften)
      points = 3;
    else if (this == StressTestAnswer.VeryOften) points = 4;
    return points;
  }
}

class StressTest extends StatefulWidget {
  final int questionCount = 2;
  StressTestState createState() => StressTestState();
}

class StressTestState extends State<StressTest> with MenuFunction {
  ///Represents current answer for the question selected through radio button (by default selected none)
  StressTestAnswer testAnswerChosen;

  ///Set of stress questions
  List<String> stressQuestions = [];

  ///Set of answers
  Map<StressTestAnswer, String> stressTestAnswerTexts;

  ///Set of stress answers
  List<StressTestAnswer> answers = [];

  ///Question counter
  int questionCounter = 0;

  ///Total Score
  int totalScore = 0;

  @override
  initState() {
    super.initState();
    stressTestAnswerTexts = Map();
    stressTestAnswerTexts[StressTestAnswer.Never] = "Never";
    stressTestAnswerTexts[StressTestAnswer.AlmostNever] = "AlmostNever";
    stressTestAnswerTexts[StressTestAnswer.Sometimes] = "Sometimes";
    stressTestAnswerTexts[StressTestAnswer.FairlyOften] = "FairlyOften";
    stressTestAnswerTexts[StressTestAnswer.VeryOften] = "VeryOften";

    stressQuestions.add('You okay?');
    stressQuestions.add('Are you sure??');

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
      ///Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StressResultTest()));
    }
  }

  Widget build(BuildContext context) {
    return SwipeableWidget(
      height: double.infinity,
      onSwipeCallback: () {
        returnBack(context);
      },
      child: TestQuestionPage(
        question: stressQuestions[questionCounter],
        answerChoices: <Widget>[
          RadioListTile(
            value: StressTestAnswer.Never,
            groupValue: testAnswerChosen,
            title: Text(stressTestAnswerTexts[StressTestAnswer.Never]),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.AlmostNever,
            groupValue: testAnswerChosen,
            title: Text(stressTestAnswerTexts[StressTestAnswer.AlmostNever]),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.Sometimes,
            groupValue: testAnswerChosen,
            title: Text(stressTestAnswerTexts[StressTestAnswer.Sometimes]),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.FairlyOften,
            groupValue: testAnswerChosen,
            title: Text(stressTestAnswerTexts[StressTestAnswer.FairlyOften]),
            onChanged: (value) {
              setSelectedStressAnswer(value);
            },
          ),
          RadioListTile(
            value: StressTestAnswer.VeryOften,
            groupValue: testAnswerChosen,
            title: Text(stressTestAnswerTexts[StressTestAnswer.VeryOften]),
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
