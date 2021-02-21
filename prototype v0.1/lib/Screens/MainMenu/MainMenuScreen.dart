import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:main_menu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AnimatedButton.dart';
import 'MainMenuDrawer.dart';
import 'ReusableMainMenuCard.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  void testChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/test');
  }

  void handleSwipe(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/helpScreen');
  }

  void moodTrackerChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/moodtracker');
  }

  void moodTrackerCalendarViewChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/moodtrackercalendarview');
  }

  void mentalSpecialistMapChosen(BuildContext context) {
    Navigator.pushNamed(context, '/mainmenu/mentalspecialistmap');
  }

  Future loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<MoodRecordDetail> decodedData =
        MoodRecordDetail.decode(prefs.get('key'));

    if (decodedData == null) return null;

    return decodedData;
  }

  Future<bool> isTodayRecorded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter');

    if (counter == null) return false;

    var moodRecordDetailList = await loadData();

    final String curDate = DateTime.now().toString().substring(0, 10);

    for (var moodRecordDetail in moodRecordDetailList) {
      String recordDate = moodRecordDetail.dateTime.toString().substring(0, 10);

      if (recordDate == curDate) return true;
    }

    return false;
  }

  Future<bool> isMoodCalendarEmpty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter');

    if (counter == null)
      return true;
    else
      return false;
  }

  Future<Widget> buildOverwriteAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'You have already checked-in today.\n\nDo you want to Overwrite it?',
              style: kThickFont.copyWith(fontSize: 19),
              textAlign: TextAlign.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  elevation: 5.0,
                  color: Colors.lightGreenAccent[100],
                  child: Text('YES'),
                  onPressed: () async {
                    setState(() {
                      //YES Action
                      moodTrackerChosen(context);
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  elevation: 5.0,
                  color: Colors.redAccent[100],
                  child: Text('NO'),
                  onPressed: () async {
                    setState(() {
                      //NO Action
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<Widget> buildEmptyCalendarAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'The calendar is Empty. \n\nTry to record something...\n',
              style: kThickFont.copyWith(fontSize: 19),
              textAlign: TextAlign.center,
            ),
            content: MaterialButton(
              elevation: 5.0,
              color: Colors.grey[400],
              child: Text('OKAY'),
              onPressed: () async {
                setState(() {
                  //NO Action
                  Navigator.pop(context);
                });
              },
            ),
          );
        });
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
                  onTap: () {
                    mentalSpecialistMapChosen(context);
                  },
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
                  textDisplayed: "Record Mood",
                  onTap: () async {
                    if (await isTodayRecorded())
                      buildOverwriteAlert();
                    else
                      moodTrackerChosen(context);
                  },
                ),
                AnimatedButton(
                  primaryColor: Colors.red[700],
                  textDisplayed: "Mood Journal",
                  onTap: () async {
                    if (await isMoodCalendarEmpty())
                      buildEmptyCalendarAlert();
                    else
                      moodTrackerCalendarViewChosen(context);
                  },
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
