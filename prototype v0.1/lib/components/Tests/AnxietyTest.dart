import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Tests/TestQuestionPage.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';

enum AnxietyTestAnswer {
  NotAtAll,
  SeveralDays,
  OverHalfTheDays,
  NearlyEveryday,
  None,
}

extension AnxietyTestAnswerExtension on AnxietyTestAnswer {
  int get points {
    int points;
    if (this == AnxietyTestAnswer.NotAtAll)
      points = 0;
    else if (this == AnxietyTestAnswer.SeveralDays)
      points = 1;
    else if (this == AnxietyTestAnswer.OverHalfTheDays)
      points = 2;
    else if (this == AnxietyTestAnswer.NearlyEveryday) points = 3;
    return points;
  }
}

class AnxietyTest extends StatefulWidget {
  final int questionCount = 7;
  AnxietyTestState createState() => AnxietyTestState();
}

class AnxietyTestState extends State<AnxietyTest> with MenuFunction {
  ///Represents current answer for the question selected through radio button (by default selected none)
  AnxietyTestAnswer testAnswerChosen;

  ///Set of anxiety questions
  List<String> anxietyQuestions = [];

  ///Set of answers
  Map<AnxietyTestAnswer, String> anxietyTestAnswerTexts;

  ///Set of anxiety answers
  List<AnxietyTestAnswer> answers = [];

  ///Question counter
  int questionCounter = 0;

  ///Total Score
  int totalScore = 0;

  @override
  initState() {
    super.initState();
    anxietyTestAnswerTexts = Map();
    anxietyTestAnswerTexts[AnxietyTestAnswer.NotAtAll] = "Never";
    anxietyTestAnswerTexts[AnxietyTestAnswer.SeveralDays] = "Almost Never";
    anxietyTestAnswerTexts[AnxietyTestAnswer.OverHalfTheDays] = "Sometimes";
    anxietyTestAnswerTexts[AnxietyTestAnswer.NearlyEveryday] = "Fairly Often";

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
        question: anxietyQuestions[questionCounter],
        answerChoices: <Widget>[
          RadioListTile(
            value: AnxietyTestAnswer.NotAtAll,
            groupValue: testAnswerChosen,
            title: Text(anxietyTestAnswerTexts[AnxietyTestAnswer.NotAtAll]),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.SeveralDays,
            groupValue: testAnswerChosen,
            title: Text(anxietyTestAnswerTexts[AnxietyTestAnswer.SeveralDays]),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.OverHalfTheDays,
            groupValue: testAnswerChosen,
            title:
                Text(anxietyTestAnswerTexts[AnxietyTestAnswer.OverHalfTheDays]),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnxietyTestAnswer.NearlyEveryday,
            groupValue: testAnswerChosen,
            title:
                Text(anxietyTestAnswerTexts[AnxietyTestAnswer.NearlyEveryday]),
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
