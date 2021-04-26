import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/components/mood_tracker/MoodEnum.dart';
import 'package:main_menu/components/mood_tracker/bottom_button.dart';
import 'package:main_menu/components/mood_tracker/custom_card.dart';
import 'package:main_menu/components/mood_tracker/icon_content.dart';
import 'package:main_menu/constants.dart';

class MoodTrackerMain extends StatefulWidget {
  @override
  _MoodTrackerMainState createState() => _MoodTrackerMainState();
}

class _MoodTrackerMainState extends State<MoodTrackerMain> with MenuFunction {
  MoodLevel moodLevel = MoodLevel.Meh;

  void goToDiary(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/diary',
      arguments: moodLevel,
    );
  }

  void changeSlide(double newSlide) {
    setState(() {
      moodLevel = MoodLevelExtension.double2MoodLevel(newSlide);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwipeablePageWidget(
      onSwipeCallback: () {
        returnBack(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                moodTrackerMessage,
                style: kThickFont,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: CustomCard(
                  colorOfCard: Colors.grey.withOpacity(0.5),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconContent(
                        icon: moodLevel.emotionIcon,
                        label: moodLevel.emotionDescription,
                        labelColor: moodLevel.labelColor,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: moodTrackerInactiveTrackColor,
                          thumbColor: moodTrackerThumbColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 14),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28),
                          overlayColor: Color(0x29A6FFF8),
                          trackHeight: 16,
                        ),
                        child: Slider(
                          value: moodLevel.moodLevel2Double,
                          min: MoodLevelExtension.worstMoodLevel()
                              .moodLevel2Double,
                          max: MoodLevelExtension.bestMoodLevel()
                              .moodLevel2Double,
                          onChanged: (double newValue) {
                            changeSlide(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                rippleColor: Colors.grey,
                buttonColor: moodTrackerThumbColor,
                buttonText: Text(
                  'Next',
                  style: kThickFont.copyWith(fontSize: 30),
                ),
                buttonAction: () {
                  goToDiary(context);
                },
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
