import 'package:flutter/material.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';

class AnxietyTestResult {
  final int resultScore;

  AnxietyTestResult({@required this.resultScore}) : assert(resultScore != null);

  ResultSet get result {
    ResultSet result;
    if (resultScore <= 5 && resultScore >= 0) {
      result = ResultSet.Normal;
    } else if (resultScore <= 10 && resultScore >= 6) {
      result = ResultSet.Normal;
    } else if (resultScore <= 15 && resultScore >= 11) {
      result = ResultSet.Moderate;
    } else if (resultScore <= 21 && resultScore >= 16) {
      result = ResultSet.High;
    }
    return result;
  }
}
