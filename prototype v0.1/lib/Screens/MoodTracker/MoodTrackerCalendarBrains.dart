import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:main_menu/components/mood_tracker/MoodEnum.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodTrackerCalenderBrains {
  //initialize variables
  List<MoodRecordDetail> _moodRecordDetailList = [];
  EventList<Event> _moodRecords = EventList<Event>();

  //initialize Mood Tracker Calendar Brain
  MoodTrackerCalenderBrains() {
    init();
  }

  void saveRecord(MoodRecordDetail moodRecordDetail) async {
    await _updateData(moodRecordDetail);
    await _saveData();
  }

  EventList<Event> get moodRecords {
    return _moodRecords;
  }

  //load/update the mood calendar data
  Future _updateData(MoodRecordDetail moodRecordDetail) async {
    final DateTime recordDate = DateTime.parse(moodRecordDetail.dateTime);

    //check if there is repeated record in the same day
    for (var data in _moodRecordDetailList) {
      print(data.title);
      if (data.dateTime == recordDate.toString()) {
        // print("number of record: " + _moodRecordDetailList.length.toString());
        _moodRecordDetailList.remove(data);
        _moodRecords.removeAll(recordDate);
        // print("deleted existing record");
        // print("number of record: " + _moodRecordDetailList.length.toString());
      }
    }

    //add the new mood record into the mood record list which will be used by mood calendar
    _moodRecordDetailList.add(moodRecordDetail);
    _moodRecords.add(
      DateTime.parse(moodRecordDetail.dateTime),
      new Event(
        date: DateTime.parse(moodRecordDetail.dateTime),
        title: moodRecordDetail.title,
        icon: moodRecordDetail.moodLevel.icon,
      ),
    );
  }

  //save mood calendar data as Json format with sharedpreferences
  Future _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    prefs.setString('key', MoodRecordDetail.encode(_moodRecordDetailList));
    prefs.setInt('counter', counter);
  }

  void init() async {
    await _initData();
  }

  //load mood calendar data with sharedpreferences
  Future _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<MoodRecordDetail> decodedData =
        MoodRecordDetail.decode(prefs.get('key'));

    return decodedData;
  }

  //initialize mood calendar
  Future _initData() async {
    List<MoodRecordDetail> savedList = await _loadData();
    //add all of the loaded data in to mood record list
    if (savedList != null) _moodRecordDetailList.addAll(savedList);

    //grab data from previous 2 input pages(mood selection page and mood record diary page)
    MoodRecordDetail firstRecord = _moodRecordDetailList.first;
    DateTime firstRecordDate =
        DateTime.parse(_moodRecordDetailList.first.dateTime);

    //use the data to create the first mood record(event object) and put it into EventList
    _moodRecords = new EventList<Event>(
      events: {
        firstRecordDate: [
          new Event(
            date: firstRecordDate,
            title: firstRecord.title,
            icon: firstRecord.moodLevel.icon,
          )
        ]
      },
    );
    // print(_moodRecordDetailList.length);

    //convert all the remaining mood record into the event object and add them into EventList if there is any
    if (_moodRecordDetailList.length > 1) {
      for (var data in _moodRecordDetailList) {
        _moodRecords.add(
          DateTime.parse(data.dateTime),
          new Event(
            date: DateTime.parse(data.dateTime),
            title: data.title,
            icon: data.moodLevel.icon,
          ),
        );
      }
    }
  }
}
