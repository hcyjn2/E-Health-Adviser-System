import 'package:flutter/material.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';
import 'package:main_menu/constants.dart';
import 'package:main_menu/components/mood_tracker/custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_menu/components/mood_tracker/icon_content.dart';

class MoodTrackerMain extends StatefulWidget {
  @override
  _MoodTrackerMainState createState() => _MoodTrackerMainState();
}

class _MoodTrackerMainState extends State<MoodTrackerMain> {
  int moodLevel = 3;
  IconData emotionIcon = FontAwesomeIcons.meh;
  String emotionDescription = 'Meh';
  Color labelColor = Colors.lime[400];

  void updateIconContent() {
    if (moodLevel == 1) {
      emotionIcon = FontAwesomeIcons.sadCry;
      emotionDescription = 'Really Terrible';
      labelColor = Colors.grey[700];
    } else if (moodLevel == 2) {
      emotionIcon = FontAwesomeIcons.frown;
      emotionDescription = 'Not Doing Well...';
      labelColor = Colors.orangeAccent[400];
    } else if (moodLevel == 3) {
      emotionIcon = FontAwesomeIcons.meh;
      emotionDescription = 'Meh';
      labelColor = Colors.lime[400];
    } else if (moodLevel == 4) {
      emotionIcon = FontAwesomeIcons.smile;
      emotionDescription = 'Pretty Good';
      labelColor = Colors.green[300];
    } else if (moodLevel == 5) {
      emotionIcon = FontAwesomeIcons.smileBeam;
      emotionDescription = 'Awesome!';
      labelColor = Colors.cyan[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'How are you feeling today?',
              style: kThickFont,
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: CustomCard(
              colorOfCard: Colors.grey.withOpacity(0.5),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconContent(emotionIcon, emotionDescription, labelColor),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFA6FFF8),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28),
                      overlayColor: Color(0x29A6FFF8),
                      trackHeight: 16,
                    ),
                    child: Slider(
                        value: moodLevel.toDouble(),
                        min: 1,
                        max: 5,
                        onChanged: (double newValue) {
                          setState(() {
                            moodLevel = newValue.round();
                            updateIconContent();
                          });
                        }),
                  )
                ],
              ),
            )),
            BottomButton(
                rippleColor: Colors.grey,
                buttonColor: Color(0xFFA6FFF8),
                buttonText: Text(
                  'Next',
                  style: kThickFont.copyWith(fontSize: 30),
                ),
                buttonAction: () {
                  Navigator.pushNamed(
                    context,
                    '/diary',
                    arguments: moodLevel,
                  );
                })
          ],
        ),
      )),
    );
  }
}
