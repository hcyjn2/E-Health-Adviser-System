import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarArguments {
  final EventList<Event> moodRecords;
  final Future calendarFuture;

  CalendarArguments({
    @required this.moodRecords,
    @required this.calendarFuture,
  });
}
