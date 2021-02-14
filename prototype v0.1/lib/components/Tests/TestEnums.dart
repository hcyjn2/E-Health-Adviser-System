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
  Never,
  Sometimes,
  FairlyOften,
  VeryOften,
  None,
}

extension StressTestAnswerExtension on StressTestAnswer {
  int get points {
    int points;
    if (this == StressTestAnswer.Never)
      points = 0;
    else if (this == StressTestAnswer.Sometimes)
      points = 1;
    else if (this == StressTestAnswer.FairlyOften)
      points = 2;
    else if (this == StressTestAnswer.VeryOften) points = 3;
    return points;
  }

  String get name {
    String name;
    if (this == StressTestAnswer.Never)
      name = "Never";
    else if (this == StressTestAnswer.Sometimes)
      name = "Sometimes";
    else if (this == StressTestAnswer.FairlyOften)
      name = "Fairly Often";
    else if (this == StressTestAnswer.VeryOften) name = "Very Often";
    return name;
  }
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
}
