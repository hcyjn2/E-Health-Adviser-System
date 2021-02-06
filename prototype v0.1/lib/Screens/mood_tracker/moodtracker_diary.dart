import 'package:flutter/material.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';
import 'package:main_menu/constants.dart';
import 'package:main_menu/components/mood_tracker/custom_card.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';

class MoodTrackerDiary extends StatefulWidget {
  final int moodLevel;

  MoodTrackerDiary({this.moodLevel});

  @override
  _MoodTrackerDiaryState createState() => _MoodTrackerDiaryState();
}

class _MoodTrackerDiaryState extends State<MoodTrackerDiary> {
  DateTime _currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String _diaryContent = '';

  final textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC7FFFB),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'What made you feel that way?',
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Write something that led to this feeling...',
                            style: kThickFont.copyWith(
                                fontSize: 19, fontWeight: FontWeight.w100),
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
                      });
                } else {
                  String dateString = _currentDate.toString();
                  MoodRecordDetail moodRecordDetail = MoodRecordDetail(
                      dateTime: dateString,
                      title: _diaryContent,
                      moodLevel: widget.moodLevel);
                  Navigator.pushNamed(
                    context,
                    '/calendar',
                    arguments: moodRecordDetail,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// buttonAction: () {
// return showDialog(
// context: context,
// builder: (context) {
// //save textfield data to _diaryContent
// _diaryContent = textEditingController.text;
// return AlertDialog(
// content: Text(
// 'Checked-in. \n' +
// "Mood = " +
// readMood(argument) +
// "\n Diary = " +
// _diaryContent,
// textAlign: TextAlign.center,
// ),
// );
// },
// );
