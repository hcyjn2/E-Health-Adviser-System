import 'dart:convert';

import 'package:flutter/material.dart';

import 'MoodEnum.dart';

class MoodRecordDetail {
  final String dateTime;
  final String title;
  final MoodLevel moodLevel;

  MoodRecordDetail({
    @required this.dateTime,
    @required this.title,
    @required this.moodLevel,
  })  : assert(dateTime != null && dateTime != ''),
        assert(title != null && title != ''),
        assert(moodLevel != null);

  factory MoodRecordDetail.fromJson(Map<String, dynamic> jsonData) {
    return MoodRecordDetail(
      dateTime: jsonData['dateTime'],
      title: jsonData['title'],
      moodLevel: MoodLevelExtension.double2MoodLevel(jsonData['moodLevel']),
    );
  }

  static Map<String, dynamic> toJson(MoodRecordDetail moodRecordDetail) => {
        'dateTime': moodRecordDetail.dateTime,
        'title': moodRecordDetail.title,
        'moodLevel': moodRecordDetail.moodLevel.moodLevel2Double,
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
