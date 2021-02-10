import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';

import 'AnimatedButton.dart';
import 'MainMenuDrawer.dart';
import 'ReusableMainMenuCard.dart';

class MainMenuScreen extends StatelessWidget {
  void testChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/test');
  }

  void handleSwipe(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/helpScreen');
  }

  void moodTrackerChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/moodtracker');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Healthier"),
      ),
      drawer: MainMenuDrawer(),
      body: SwipeableWidget(
        onSwipeCallback: () {
          handleSwipe(context);
        },
        height: double.infinity,
        direction: SwipeDirection.toLeft,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedButton(
                  primaryColor: Color.fromRGBO(57, 92, 249, 1),
                  textDisplayed: "Local Clinic",
                  onTap: () {},
                ),
                AnimatedButton(
                  primaryColor: Colors.yellow[700],
                  textDisplayed: "Test",
                  onTap: () {
                    testChosen(context);
                  },
                ),
                AnimatedButton(
                  primaryColor: Colors.green[400],
                  textDisplayed: "MoodTracker",
                  onTap: () {
                    moodTrackerChosen(context);
                  },
                ),
                AnimatedButton(
                  primaryColor: Colors.red[700],
                  textDisplayed: "Diary",
                  onTap: () {},
                ),
                //Mood Select
                Container(
                    //MoodTracker Test
                    child: ReusableMainMenuCard(
                  mainMenuCard: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: InkWell(
                              onTap: () {
                                print("one");
                              },
                              child: FaIcon(
                                FontAwesomeIcons.laughBeam,
                              )),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              print("two");
                            },
                            child: FaIcon(
                              FontAwesomeIcons.smile,
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              print("three");
                            },
                            child: FaIcon(
                              FontAwesomeIcons.meh,
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              print("four");
                            },
                            child: FaIcon(
                              FontAwesomeIcons.frown,
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              print("five");
                            },
                            child: FaIcon(
                              FontAwesomeIcons.angry,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
