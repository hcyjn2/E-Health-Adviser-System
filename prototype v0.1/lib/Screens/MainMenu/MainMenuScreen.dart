import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:main_menu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AnimatedButton.dart';
import 'MainMenuDrawer.dart';

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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/menubackground.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "E-Health Adviser App",
            style: kThickFont.copyWith(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(97, 145, 150, 1),
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
                    primaryColor: Color.fromRGBO(132, 180, 200, 1),
                    assetImage: Image.asset(
                      'assets/Images/clinics.png',
                      width: 64,
                    ),
                    buttonText: Text('Local Clinics',
                        style: kThickFont.copyWith(fontSize: 20)),
                    onTap: () {
                      mentalSpecialistMapChosen(context);
                    },
                  ),
                  AnimatedButton(
                    primaryColor: Color.fromRGBO(178, 220, 214, 1),
                    assetImage: Image.asset(
                      'assets/Images/test.png',
                      width: 62,
                    ),
                    buttonText:
                        Text('Test', style: kThickFont.copyWith(fontSize: 20)),
                    onTap: () {
                      testChosen(context);
                    },
                  ),
                  AnimatedButton(
                    primaryColor: Color.fromRGBO(244, 220, 214, 1),
                    assetImage: Image.asset(
                      'assets/Images/moodrecord.png',
                      width: 62,
                    ),
                    buttonText: Text('Record Mood',
                        style: kThickFont.copyWith(fontSize: 20)),
                    onTap: () async {
                      if (await isTodayRecorded())
                        buildOverwriteAlert();
                      else
                        moodTrackerChosen(context);
                    },
                  ),
                  AnimatedButton(
                    primaryColor: Color.fromRGBO(223, 199, 193, 1),
                    assetImage: Image.asset(
                      'assets/Images/calendar.png',
                      width: 62,
                    ),
                    buttonText: Text('Mood Journal',
                        style: kThickFont.copyWith(fontSize: 20)),
                    onTap: () async {
                      if (await isMoodCalendarEmpty())
                        buildEmptyCalendarAlert();
                      else
                        moodTrackerCalendarViewChosen(context);
                    },
                  ), //Mood Select
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
