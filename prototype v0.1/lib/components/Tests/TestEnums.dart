import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:main_menu/constants.dart';

/// Enumerations and appropriate extensions to replace usega of numeric and textual data parameters
enum Tests {
  Stress,
  Anxiety,
}

extension TestsExtension on Tests {
  String get testType {
    String type;
    if (this == Tests.Stress)
      type = "Stress";
    else if (this == Tests.Anxiety) type = "Anxiety";
    return type;
  }
}

enum AnswerSet {
  NotAtAll,
  SeveralDays,
  OverHalfTheDays,
  NearlyEveryday,
  None,
}

extension AnswerSetExtension on AnswerSet {
  int get points {
    int points;
    if (this == AnswerSet.NotAtAll)
      points = 0;
    else if (this == AnswerSet.SeveralDays)
      points = 1;
    else if (this == AnswerSet.OverHalfTheDays)
      points = 2;
    else if (this == AnswerSet.NearlyEveryday) points = 3;
    return points;
  }

  String get name {
    String name;
    if (this == AnswerSet.NotAtAll)
      name = "Not at all";
    else if (this == AnswerSet.SeveralDays)
      name = "Several Days";
    else if (this == AnswerSet.OverHalfTheDays)
      name = "Over half the days";
    else if (this == AnswerSet.NearlyEveryday) name = "Nearly Everyday";
    return name;
  }

  static int maxScore() => AnswerSet.values.length - 2;
}

enum ResultSet {
  Normal,
  Mild,
  Moderate,
  Severe,
  ExtremelySevere,
  High,
}

extension StressTestExtension on ResultSet {
  Text get resultExplanation {
    String text;
    if (this == ResultSet.Normal)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and be aware of the symptoms of stress";
    else if (this == ResultSet.Mild)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and be aware of the symptoms of stress";
    else if (this == ResultSet.Moderate)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and follow some of the advices given bellow to reduce stress";
    else if (this == ResultSet.Severe)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and follow some of the advices given bellow to reduce stress";
    else if (this == ResultSet.ExtremelySevere)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and strongly recommended to follow advices given bellow to reduce stress";
    else if (this == ResultSet.High)
      text = "Your results indicate that your stress levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor and strongly recommended to follow advices given bellow to reduce stress";
    return Text(
      text,
      textAlign: TextAlign.left,
      style: kThickFont.copyWith(
        color: Colors.indigo[900],
        fontSize: 22,
      ),
    );
  }
}

extension AnxietyTestExtension on ResultSet {
  Text get resultExplanation {
    String text;
    if (this == ResultSet.Normal)
      text = "Your results indicate that your anxiety levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor your anxiety levels.";
    else if (this == ResultSet.Mild)
      text = "Your results indicate that your anxiety levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor your anxiety levels and follow some of the advices given bellow to reduce this negative emotional state.";
    else if (this == ResultSet.Moderate)
      text = "Your results indicate that your anxiety levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor your anxiety levels and follow some of the advices given bellow to reduce this negative emotional state. If you begin experiencing these emotions frequently and strongly or if you feel that you need help then you should always seek the advice of a medical professional.";
    else if (this == ResultSet.Severe)
      text = "Your results indicate that your anxiety levels are currently at a " +
          this.name +
          " level. It is suggested that you continue to monitor your anxiety levels and strongly recommend to follow advices given bellow to reduce this negative emotional state. If you begin experiencing these emotions frequently and strongly or if you feel that you need help then you should always seek the advice of a medical professional.";
    else if (this == ResultSet.ExtremelySevere)
      text = "Your results indicate that your anxiety levels are currently at an " +
          this.name +
          " level. It is recommended to seek out for help of the medical professional.";
    else if (this == ResultSet.High)
      text = "Your results indicate that your anxiety levels are currently at an " +
          this.name +
          " level. It is strongly recommended to seek out for help of the medical professional.";
    return Text(
      text,
      textAlign: TextAlign.left,
      style: kThickFont.copyWith(
        color: Colors.indigo[900],
        fontSize: 22,
      ),
    );
  }

  bool get isProfessionalHelpNeeded {
    return (this == ResultSet.Normal || this == ResultSet.Mild ? false : true);
  }
}

extension ResultSetExtension on ResultSet {
  String get name {
    String name;
    if (this == ResultSet.Normal)
      name = "Normal";
    else if (this == ResultSet.Mild)
      name = "Mild";
    else if (this == ResultSet.Moderate)
      name = "Moderate";
    else if (this == ResultSet.Severe)
      name = "Severe";
    else if (this == ResultSet.ExtremelySevere)
      name = "Extremely Severe";
    else if (this == ResultSet.High) name = "High";
    return name;
  }

  Color get color {
    Color color;
    if (this == ResultSet.Normal)
      color = Colors.green;
    else if (this == ResultSet.Mild)
      color = Colors.blue;
    else if (this == ResultSet.Moderate)
      color = Colors.yellow;
    else if (this == ResultSet.Severe)
      color = Colors.orange;
    else if (this == ResultSet.ExtremelySevere)
      color = Colors.red;
    else if (this == ResultSet.High) color = Colors.red;
    return color;
  }
}
