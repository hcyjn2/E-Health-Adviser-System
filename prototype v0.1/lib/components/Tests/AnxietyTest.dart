import 'package:flutter/material.dart';
import 'package:main_menu/Screens/LocateMentalClinic/MentalClinicScreen.dart';
import 'package:main_menu/Screens/Tests/ResultPage.dart';
import 'package:main_menu/Screens/Tests/TestQuestionPage.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/components/Tests/AnxietyTestResult.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';

import '../../constants.dart';
import 'AnxietyAdvices.dart';
import 'TestEnums.dart';

class AnxietyTest extends StatefulWidget {
  final int questionCount = 7;
  AnxietyTestState createState() => AnxietyTestState();
}

class AnxietyTestState extends State<AnxietyTest> with MenuFunction {
  ///Represents current answer for the question selected through radio button (by default selected none)
  AnswerSet testAnswerChosen;

  ///Set of anxiety questions
  List<String> anxietyQuestions = [];

  ///Set of anxiety answers
  List<AnswerSet> answers = [];

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

    testAnswerChosen = AnswerSet.None;

    questionCounter = 0;
  }

  setSelectedAnxietyAnswer(AnswerSet value) {
    print("Anxiety Test answer $value is chosen");
    setState(() {
      testAnswerChosen = value;
    });
  }

  void onEmptyTestAnswerAction(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            emptyTestAnswerChosen,
            style:
                kThickFont.copyWith(fontSize: 19, fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          ),
          content: MaterialButton(
            elevation: 5.0,
            color: Colors.grey[400],
            child: Text(
              'OKAY',
              style: kThickFont.copyWith(fontSize: 17),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  nextQuestion() {
    print('Next pressed');
    if (testAnswerChosen == AnswerSet.None) {
      onEmptyTestAnswerAction(context);
      return;
    }
    answers.add(testAnswerChosen);
    totalScore += testAnswerChosen.points;
    if (questionCounter + 1 < widget.questionCount) {
      setState(() {
        testAnswerChosen = AnswerSet.None;
        questionCounter++;
      });
    } else {
      final Widget locateButton = BottomButton(
        buttonColor: Color.fromRGBO(178, 220, 214, 1),
        buttonText: Text(
          'Local Clinic',
          style: kThickFont.copyWith(fontSize: 30),
        ),
        buttonAction: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MentalClinicMap()));
        },
        rippleColor: Colors.grey,
      );
      final AnxietyTestResult results =
          AnxietyTestResult(resultScore: totalScore);
      final AnxietyAdvices anxietyAdvices = AnxietyAdvices();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ResultPage(
                    testType: Tests.Anxiety,
                    resultScore: totalScore /
                        (widget.questionCount * AnswerSetExtension.maxScore()),
                    resultPhrase: results.result.name,
                    resultColor: results.result.color,
                    resultExplanation:
                        AnxietyTestExtension(results.result).resultExplanation,
                    advices: anxietyAdvices.getAdvices(5),
                    body: results.result.isProfessionalHelpNeeded
                        ? <Widget>[locateButton]
                        : null,
                  )));
    }
  }

  Widget build(BuildContext context) {
    return SwipeablePageWidget(
      onSwipeCallback: () {
        returnBack(context);
      },
      child: TestQuestionPage(
        questionNumber: questionCounter + 1,
        question: anxietyQuestions[questionCounter],
        answerChoices: <Widget>[
          RadioListTile(
            value: AnswerSet.NotAtAll,
            groupValue: testAnswerChosen,
            title: Text(AnswerSet.NotAtAll.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnswerSet.SeveralDays,
            groupValue: testAnswerChosen,
            title: Text(AnswerSet.SeveralDays.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnswerSet.OverHalfTheDays,
            groupValue: testAnswerChosen,
            title: Text(AnswerSet.OverHalfTheDays.name),
            onChanged: (value) {
              setSelectedAnxietyAnswer(value);
            },
          ),
          RadioListTile(
            value: AnswerSet.NearlyEveryday,
            groupValue: testAnswerChosen,
            title: Text(AnswerSet.NearlyEveryday.name),
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
