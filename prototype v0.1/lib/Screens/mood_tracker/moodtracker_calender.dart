import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:main_menu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodTrackerCalender extends StatefulWidget {
  @override
  _MoodTrackerCalenderState createState() => _MoodTrackerCalenderState();

  MoodRecordDetail moodRecordDetail;

  MoodTrackerCalender({this.moodRecordDetail});
}

class _MoodTrackerCalenderState extends State<MoodTrackerCalender> {
  //initialize properties
  DateTime _currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  List<MoodRecordDetail> moodRecordDetailList;
  EventList<Event> moodRecords;
  Future calendarFuture;

  _getCalendarFuture() async {
    return await updateUI();
  }

  Icon readMoodLevel(int moodLevel) {
    switch (moodLevel) {
      case 1:
        return Icon(FontAwesomeIcons.sadCry, color: Colors.grey[700]);
      case 2:
        return Icon(FontAwesomeIcons.frown, color: Colors.orangeAccent[400]);
      case 3:
        return Icon(FontAwesomeIcons.meh, color: Colors.lime[400]);
      case 4:
        return Icon(FontAwesomeIcons.smile, color: Colors.green[300]);
      case 5:
        return Icon(FontAwesomeIcons.smileBeam, color: Colors.cyan[300]);
      default:
        return Icon(
          FontAwesomeIcons.cross,
          color: Colors.red,
        );
    }
  }

  void saveData(List<MoodRecordDetail> moodRecordDetailList,
      MoodRecordDetail newMoodRecordDetail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (moodRecordDetailList == null)
      moodRecordDetailList = [newMoodRecordDetail];
    else
      moodRecordDetailList.add(newMoodRecordDetail);

    prefs.setString('key', MoodRecordDetail.encode(moodRecordDetailList));
  }

  Future<List<MoodRecordDetail>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<MoodRecordDetail> decodedData =
        MoodRecordDetail.decode(prefs.get('key'));

    return decodedData;
  }

  Future updateUI() async {
    await saveData(moodRecordDetailList, widget.moodRecordDetail);
    moodRecordDetailList = await loadData();

    MoodRecordDetail newRecord = widget.moodRecordDetail;
    DateTime recordDate = DateTime.parse(widget.moodRecordDetail.dateTime);

    moodRecords = new EventList<Event>(
      events: {
        recordDate: [
          new Event(
              date: recordDate,
              title: newRecord.title,
              icon: readMoodLevel(newRecord.moodLevel))
        ]
      },
    );

    if (moodRecordDetailList.length > 1) {
      print('loop');
      for (var data in moodRecordDetailList) {
        moodRecords.add(
          DateTime.parse(data.dateTime),
          new Event(
            date: DateTime.parse(data.dateTime),
            title: data.title,
            icon: readMoodLevel(data.moodLevel),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    calendarFuture = _getCalendarFuture();
  }

  @override
  void dispose() {
    super.dispose();
    saveData(moodRecordDetailList, widget.moodRecordDetail);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                      child: Text(
                    _currentMonth,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )),
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
              child: FutureBuilder(
                future: calendarFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return //calendar properties
                        CalendarCarousel<Event>(
                      dayCrossAxisAlignment: CrossAxisAlignment.start,
                      onDayPressed: (DateTime date, List<Event> events) {
                        this.setState(() => _currentDate = date);
                        events.forEach((event) {
                          if (event.date == date) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        event.getIcon(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 250,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                event.title,
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
                                          height: 30,
                                        ),
                                        MaterialButton(
                                          elevation: 5.0,
                                          color: Colors.grey[400],
                                          child: Text('BACK'),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                      },
                      weekendTextStyle: TextStyle(
                        color: Colors.red,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
                      showHeader: false,
                      weekFormat: false,
                      markedDatesMap: moodRecords,
                      height: 270.0,
                      selectedDateTime: _currentDate,
                      showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
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
                  } else {
                    return Text(
                      'Loading...',
                      style: kThickFont.copyWith(fontSize: 15),
                    );
                  }
                },
              ),
              height: 310,
            ),
          ],
        ),
      ),
    );
  }
}

// FlatButton(
// color: Colors.blueAccent[100],
// child: Text('SAVE'),
// onPressed: () async {
// await saveData(moodRecordDetailList, widget.moodRecordDetail);
// setState(() {});
// },
// ),
// FlatButton(
// color: Colors.amberAccent[100],
// child: Text('LOAD'),
// onPressed: () async {
// await updateUI();
// setState(() {});
// },
// )
// FlatButton(
// color: Colors.purpleAccent[100],
// child: Text('CLEAR'),
// onPressed: () async {
// SharedPreferences preferences =
//     await SharedPreferences.getInstance();
// await preferences.clear();
// },
// ),

// createAlertDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'You have already check-in today.\n\nDo you want to Overwrite it?',
//             style: kThickFont.copyWith(fontSize: 19),
//             textAlign: TextAlign.center,
//           ),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MaterialButton(
//                 elevation: 5.0,
//                 color: Colors.lightGreenAccent[100],
//                 child: Text('YES'),
//                 onPressed: () async {
//                   Navigator.pop(context);
//                 },
//               ),
//               SizedBox(
//                 width: 30,
//               ),
//               MaterialButton(
//                 elevation: 5.0,
//                 color: Colors.redAccent[100],
//                 child: Text('NO'),
//                 onPressed: () async {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       });
// }
