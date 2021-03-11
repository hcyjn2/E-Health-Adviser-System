import 'package:flutter/material.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:main_menu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';


import 'AnimatedButton.dart';
import 'MainMenuDrawer.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        builder: Builder(builder: (context) => MenuBody()),
        autoPlay: false,
        autoPlayDelay: Duration(seconds: 3),
        autoPlayLockEnable: false,
      ),
    );
  }
}

class MenuBody extends StatefulWidget {
  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  GlobalKey _sideBarKey = GlobalKey();
  GlobalKey _localClinicKey = GlobalKey();
  GlobalKey _diagnosisKey = GlobalKey();
  GlobalKey _moodKey = GlobalKey();
  GlobalKey _journalKey = GlobalKey();
  GlobalKey _swipeKey = GlobalKey();

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
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
          );
        });
  }

  Future<bool> isFirstGuide() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool showCaseVisibilityStatus = preferences.getBool("isFirstShowcase");

    if(showCaseVisibilityStatus == null){
      preferences.setBool("isFirstShowcase", false);
      return true;
    }
    return false;
  }

  Future<Widget> buildUserGuideWelcome() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Welcome! \n\nThis is a brief tutorial to show you around.\n',
              style: kThickFont.copyWith(fontSize: 19),
              textAlign: TextAlign.center,
            ),
            content: MaterialButton(
              elevation: 5.0,
              color: Colors.grey[400],
              child: Text('Get Started'),
              onPressed: ()  {
                  Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    isFirstGuide().then((status) {
      if(status){
        buildUserGuideWelcome().then((status) {
          ShowCaseWidget.of(context).startShowCase([
            _sideBarKey,
            _localClinicKey,
            _diagnosisKey,
            _moodKey,
            _journalKey,
            _swipeKey
          ]);
        });
      }
    });

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/menubackground.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Showcase(
                  key: _sideBarKey,
                  description: 'Tap here to access setting,logout and etc.',
                  child: Icon(Icons.menu)
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          title: Showcase(
            key: _swipeKey,
            //TODO: need to add appropriate text for the emergency swipe feature
            description: 'And lastly, (placeholder text)',
            showArrow: false,
            child: Text(
                "E-Health Adviser App",
                style: kThickFont.copyWith(fontSize: 18, color: Colors.black),
              ),
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
                  Showcase(
                    key: _localClinicKey,
                    description: 'Tap to see nearby clinics',
                    child: AnimatedButton(
                      primaryColor: Color.fromRGBO(132, 180, 200, 1),
                      assetImage: Image.asset(
                        'assets/Images/clinics.png',
                        width: 62,
                      ),
                      buttonText: Text('Local Clinics',
                          style: kThickFont.copyWith(fontSize: 20)),
                      onTap: () {
                        mentalSpecialistMapChosen(context);
                      },
                    ),
                  ),
                  Showcase(
                    key: _diagnosisKey,
                    description: 'Tap here to take a diagnosis',
                    child: AnimatedButton(
                      primaryColor: Color.fromRGBO(178, 220, 214, 1),
                      assetImage: Image.asset(
                        'assets/Images/test.png',
                        width: 62,
                      ),
                      buttonText: Text('Diagnosis',
                          style: kThickFont.copyWith(fontSize: 20)),
                      onTap: () {
                        testChosen(context);
                      },
                    ),
                  ),
                  Showcase(
                    key: _moodKey,
                    description: 'Tap here to fill in how you are feeling today',
                    child: AnimatedButton(
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
                  ),
                  Showcase(
                    key: _journalKey,
                    description: 'Tap here to see your journal entry',
                    child: AnimatedButton(
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
                    ),
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
