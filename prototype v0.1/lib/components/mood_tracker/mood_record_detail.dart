import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MoodRecordDetail {
  final String dateTime;
  final String title;
  final int moodLevel;

  MoodRecordDetail({this.dateTime, this.title, this.moodLevel});

  factory MoodRecordDetail.fromJson(Map<String, dynamic> jsonData) {
    return MoodRecordDetail(
      dateTime: jsonData['dateTime'],
      title: jsonData['title'],
      moodLevel: jsonData['moodLevel'],
    );
  }

  static Map<String, dynamic> toJson(MoodRecordDetail moodRecordDetail) => {
        'dateTime': moodRecordDetail.dateTime,
        'title': moodRecordDetail.title,
        'moodLevel': moodRecordDetail.moodLevel
      };

  static String encode(List<MoodRecordDetail> moodRecordDetailList) =>
      json.encode(
        moodRecordDetailList
            .map<Map<String, dynamic>>(
                (moodRecordDetail) => MoodRecordDetail.toJson(moodRecordDetail))
            .toList(),
      );

  static List<MoodRecordDetail> decode(String moodRecordDetailList) =>
      (json.decode(moodRecordDetailList) as List<dynamic>)
          .map<MoodRecordDetail>((item) => MoodRecordDetail.fromJson(item))
          .toList();
}
