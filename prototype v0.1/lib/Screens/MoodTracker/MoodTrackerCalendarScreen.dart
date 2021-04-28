import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:main_menu/Screens/MoodTracker/MoodTrackerCalendarBrains.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/constants.dart';

class MoodTrackerCalenderScreen extends StatefulWidget {
  //initialize brains variable
  final MoodTrackerCalenderBrains brains;
  //grab data from previous page
  MoodTrackerCalenderScreen({
    Key key,
    @required this.brains,
  })  : assert(brains != null),
        super(key: key);
  @override
  _MoodTrackerCalenderScreenState createState() =>
      _MoodTrackerCalenderScreenState();
}

class _MoodTrackerCalenderScreenState extends State<MoodTrackerCalenderScreen>
    with MenuFunction {
  //initialize variables
  DateTime _currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  EventList<Event> moodRecords;

  @override
  void initState() {
    super.initState();
    moodRecords = widget.brains.moodRecords;
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //page title
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                child: Text(
                  'Your Journey',
                  style: kThickFont,
                  textAlign: TextAlign.center,
                ),
              ),
              //Calendar NavBar
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        //current month label
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),

                    //calendar nagivation buttons
                    FlatButton(
                      color: Colors.redAccent[100],
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FlatButton(
                      color: Colors.greenAccent[100],
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              //Mood Calendar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.5),
                child: Builder(
                  builder: (context) {
                    //Mood Calendar
                    return //calendar properties
                        CalendarCarousel<Event>(
                      dayCrossAxisAlignment: CrossAxisAlignment.start,
                      onDayPressed: (DateTime date, List<Event> events) {
                        this.setState(() => _currentDate = date);
                        if (events.isNotEmpty) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    date.toString().substring(0, 10),
                                    style: kThickFont.copyWith(fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      events.first.getIcon(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 250,
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              events.first.title,
                                              style: kThickFont.copyWith(
                                                  fontSize: 17),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      MaterialButton(
                                        elevation: 5.0,
                                        color: Colors.grey[400],
                                        child: Text(
                                          'BACK',
                                          style:
                                              kThickFont.copyWith(fontSize: 17),
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                      weekendTextStyle: TextStyle(
                        color: Colors.red,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
                      showHeader: false,
                      weekFormat: false,
                      markedDatesMap: moodRecords,
                      height: 270.0,
                      selectedDateTime: _currentDate,
                      showIconBehindDayText: true,
                      customGridViewPhysics: NeverScrollableScrollPhysics(),
                      markedDateShowIcon: true,
                      markedDateIconMaxShown: 1,
                      markedDateIconMargin: 10.80,
                      selectedDayTextStyle: TextStyle(
                          color: Colors.tealAccent,
                          fontWeight: FontWeight.bold),
                      todayTextStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      markedDateIconBuilder: (event) {
                        return event.icon;
                      },
                      minSelectedDate:
                          _currentDate.subtract(Duration(days: 360)),
                      maxSelectedDate: _currentDate.add(Duration(days: 360)),
                      todayButtonColor: Colors.transparent,
                      todayBorderColor: Colors.transparent,
                      selectedDayButtonColor: Colors.transparent,
                      targetDateTime: _targetDateTime,
                      markedDateMoreShowTotal: null,
                      isScrollable: false,
                    );
                  },
                ),
                height: 310,
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
