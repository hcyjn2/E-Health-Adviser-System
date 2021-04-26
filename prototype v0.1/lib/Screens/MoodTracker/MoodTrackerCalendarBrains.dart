import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:main_menu/components/mood_tracker/MoodEnum.dart';
import 'package:main_menu/components/mood_tracker/mood_record_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodTrackerCalenderBrains {
  List<MoodRecordDetail> _moodRecordDetailList = [];
  EventList<Event> _moodRecords = EventList<Event>();

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

  Future _updateData(MoodRecordDetail moodRecordDetail) async {
    final DateTime recordDate = DateTime.parse(moodRecordDetail.dateTime);

    for (var data in _moodRecordDetailList) {
      print(data.title);
      if (data.dateTime == recordDate.toString()) {
        print("number of record: " + _moodRecordDetailList.length.toString());
        _moodRecordDetailList.remove(data);
        _moodRecords.removeAll(recordDate);
        print("deleted existing record");
        print("number of record: " + _moodRecordDetailList.length.toString());
      }
    }
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

  Future _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<MoodRecordDetail> decodedData =
        MoodRecordDetail.decode(prefs.get('key'));

    return decodedData;
  }

  Future _initData() async {
    List<MoodRecordDetail> savedList = await _loadData();
    if (savedList != null) _moodRecordDetailList.addAll(savedList);

    MoodRecordDetail firstRecord = _moodRecordDetailList.first;
    DateTime firstRecordDate =
        DateTime.parse(_moodRecordDetailList.first.dateTime);

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
    print(_moodRecordDetailList.length);
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
