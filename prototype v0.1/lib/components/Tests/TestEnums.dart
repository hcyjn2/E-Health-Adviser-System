import 'dart:ui';

import 'package:flutter/material.dart';

enum Tests {
  Stress,
  Anxiety,
}

extension TestTypeExtension on Tests {
  String get testType {
    String type;
    if (this == Tests.Stress)
      type = "Stress";
    else if (this == Tests.Anxiety) type = "Anxiety";
    return type;
  }
}

enum StressTestAnswer {
  NotAtAll,
  SeveralDays,
  OverHalfTheDays,
  NearlyEveryday,
  None,
}

extension StressTestAnswerExtension on StressTestAnswer {
  int get points {
    int points;
    if (this == StressTestAnswer.NotAtAll)
      points = 0;
    else if (this == StressTestAnswer.SeveralDays)
      points = 1;
    else if (this == StressTestAnswer.OverHalfTheDays)
      points = 2;
    else if (this == StressTestAnswer.NearlyEveryday) points = 3;
    return points;
  }

  String get name {
    String name;
    if (this == StressTestAnswer.NotAtAll)
      name = "Not at all";
    else if (this == StressTestAnswer.SeveralDays)
      name = "Several Days";
    else if (this == StressTestAnswer.OverHalfTheDays)
      name = "Over half the days";
    else if (this == StressTestAnswer.NearlyEveryday) name = "Nearly Everyday";
    return name;
  }

  static int maxScore() => StressTestAnswer.values.length - 2;
}

enum AnxietyTestAnswer {
  NotAtAll,
  SeveralDays,
  OverHalfTheDays,
  NearlyEveryday,
  None,
}

extension AnxietyTestAnswerExtension on AnxietyTestAnswer {
  int get points {
    int points;
    if (this == AnxietyTestAnswer.NotAtAll)
      points = 0;
    else if (this == AnxietyTestAnswer.SeveralDays)
      points = 1;
    else if (this == AnxietyTestAnswer.OverHalfTheDays)
      points = 2;
    else if (this == AnxietyTestAnswer.NearlyEveryday) points = 3;
    return points;
  }

  String get name {
    String name;
    if (this == AnxietyTestAnswer.NotAtAll)
      name = "Not at all";
    else if (this == AnxietyTestAnswer.SeveralDays)
      name = "Several Days";
    else if (this == AnxietyTestAnswer.OverHalfTheDays)
      name = "Over half the days";
    else if (this == AnxietyTestAnswer.NearlyEveryday) name = "Nearly Everyday";
    return name;
  }

  static int get maxScore {
    return AnxietyTestAnswer.values.length - 2;
  }
}

enum ResultSet {
  Normal,
  Mild,
  Moderate,
  Severe,
  ExtremelySevere,
  High,
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
