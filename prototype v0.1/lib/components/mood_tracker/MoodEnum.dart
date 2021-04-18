import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MoodLevel {
  ReallyTerrible,
  NotWell,
  Meh,
  PrettyGood,
  Awesome,
  NotSet,
}

extension MoodLevelExtension on MoodLevel {
  static final _worstMoodLevel = MoodLevel.ReallyTerrible;
  static final _bestMoodLevel = MoodLevel.Awesome;
  IconData get emotionIcon {
    IconData emotionIcon;
    if (this == MoodLevel.ReallyTerrible)
      emotionIcon = FontAwesomeIcons.sadCry;
    else if (this == MoodLevel.NotWell)
      emotionIcon = FontAwesomeIcons.frown;
    else if (this == MoodLevel.Meh)
      emotionIcon = FontAwesomeIcons.meh;
    else if (this == MoodLevel.PrettyGood)
      emotionIcon = FontAwesomeIcons.smile;
    else if (this == MoodLevel.Awesome)
      emotionIcon = FontAwesomeIcons.smileBeam;
    else if (this == MoodLevel.NotSet) emotionIcon = FontAwesomeIcons.cross;

    return emotionIcon;
  }

  String get emotionDescription {
    String emotionDescription;

    if (this == MoodLevel.ReallyTerrible)
      emotionDescription = 'Really Terrible';
    else if (this == MoodLevel.NotWell)
      emotionDescription = 'Not Doing Well...';
    else if (this == MoodLevel.Meh)
      emotionDescription = 'Meh';
    else if (this == MoodLevel.PrettyGood)
      emotionDescription = 'Pretty Good';
    else if (this == MoodLevel.Awesome) emotionDescription = 'Awesome!';

    return emotionDescription;
  }

  Color get labelColor {
    Color labelColor;

    if (this == MoodLevel.ReallyTerrible)
      labelColor = Colors.grey[700];
    else if (this == MoodLevel.NotWell)
      labelColor = Colors.orangeAccent[400];
    else if (this == MoodLevel.Meh)
      labelColor = Colors.lime[400];
    else if (this == MoodLevel.PrettyGood)
      labelColor = Colors.green[300];
    else if (this == MoodLevel.Awesome)
      labelColor = Colors.cyan[300];
    else if (this == MoodLevel.NotSet) labelColor = Colors.red;

    return labelColor;
  }

  Icon get icon {
    return Icon(this.emotionIcon, color: this.labelColor);
  }

  static MoodLevel worstMoodLevel() {
    return _worstMoodLevel;
  }

  static MoodLevel bestMoodLevel() {
    return _bestMoodLevel;
  }

  double get moodLevel2Double {
    double doubleValue;

    if (this == MoodLevel.ReallyTerrible)
      doubleValue = 1.0;
    else if (this == MoodLevel.NotWell)
      doubleValue = 2.0;
    else if (this == MoodLevel.Meh)
      doubleValue = 3.0;
    else if (this == MoodLevel.PrettyGood)
      doubleValue = 4.0;
    else if (this == MoodLevel.Awesome) doubleValue = 5.0;

    return doubleValue;
  }

  static MoodLevel double2MoodLevel(double doubleValue) {
    MoodLevel moodLevel;
    int intValue = doubleValue.round();

    if (intValue == 1)
      moodLevel = MoodLevel.ReallyTerrible;
    else if (intValue == 2)
      moodLevel = MoodLevel.NotWell;
    else if (intValue == 3)
      moodLevel = MoodLevel.Meh;
    else if (intValue == 4)
      moodLevel = MoodLevel.PrettyGood;
    else if (intValue == 5) moodLevel = MoodLevel.Awesome;

    return moodLevel;
  }
}
