import 'package:flutter/material.dart';
import 'package:main_menu/Screens/MoodTracker/MoodTrackerCalendarBrains.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/components/mood_tracker/MoodEnum.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';
import 'package:main_menu/components/mood_tracker/custom_card.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:main_menu/constants.dart';

class MoodTrackerDiary extends StatefulWidget {
  final MoodLevel moodLevel;

  MoodTrackerDiary({
    Key key,
    @required this.moodLevel,
  })  : assert(moodLevel != null),
        super(key: key);

  @override
  _MoodTrackerDiaryState createState() => _MoodTrackerDiaryState();
}

class _MoodTrackerDiaryState extends State<MoodTrackerDiary> with MenuFunction {
  DateTime _currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String _diaryContent = '';
  final textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SwipeablePageWidget(
      onSwipeCallback: () {
        returnBack(context);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: moodTrackerDiaryBgColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                moodDiaryMessage,
                style: kThickFont,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: CustomCard(
                  colorOfCard: Colors.white.withOpacity(0.9),
                  cardChild: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type here...',
                      ),
                      controller: textEditingController,
                      style: TextStyle(fontSize: 22, fontFamily: 'Manrope'),
                      onChanged: (newValue) {
                        _diaryContent = newValue;
                      },
                    ),
                  ),
                ),
              ),
              BottomButton(
                rippleColor: Colors.grey,
                buttonColor: Colors.redAccent[400].withOpacity(0.75),
                buttonText: Text(
                  'Check-in',
                  style: kThickFont.copyWith(
                    fontSize: 30,
                  ),
                ),
                buttonAction: () {
                  if (_diaryContent.isEmpty) {
                    onEmptyDiaryAction();
                  } else {
                    nextScreen();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void onEmptyDiaryAction() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            moodDiaryNoRecordMessage,
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

  void nextScreen() {
    MoodRecordDetail moodRecordDetail = MoodRecordDetail(
      dateTime: _currentDate.toString(),
      title: _diaryContent,
      moodLevel: widget.moodLevel,
    );
    MoodTrackerCalenderBrains brains = MoodTrackerCalenderBrains();
    brains.saveRecord(moodRecordDetail);
    Navigator.pushNamed(
      context,
      '/calendar',
      arguments: brains,
    );
  }
}
