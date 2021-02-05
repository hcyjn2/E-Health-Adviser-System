import 'package:flutter/material.dart';

import 'Screens/Help/ImmediateHelpScreen.dart';
import 'Screens/MainMenu/MainMenuScreen.dart';
import 'Screens/MainMenu/TestMenu.dart';
import 'Screens/Welcome/welcomescreen.dart';
import 'Screens/mood_tracker/moodtracker_calender.dart';
import 'Screens/mood_tracker/moodtracker_diary.dart';
import 'Screens/mood_tracker/moodtracker_main.dart';
import 'components/mood_tracker/mood_record_detail.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //TODO : need to make the user stay logged in.
    //Starting point of the app will be the WelcomeScreen. if user is logged in then the starting screen is MainMenuScreen().
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter SEGP11A',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: const Color(0xFFF5F5EF),
        ),
        home: WelcomeScreen(),
        routes: {
          '/mainmenu/moodtracker': (context) => MoodTrackerMain(),
          '/mainmenu': (context) => MainMenuScreen(),
          '/mainmenu/test': (context) => TestMenu(),
          '/mainmenu/helpScreen': (context) => ImmediateHelpScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/diary') {
            int arg = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => MoodTrackerDiary(
                      moodLevel: arg,
                    ));
          } else if (settings.name == '/calendar') {
            MoodRecordDetail arg = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => MoodTrackerCalender(
                      moodRecordDetail: arg,
                    ));
          }
          return null;
        });
  }
}
