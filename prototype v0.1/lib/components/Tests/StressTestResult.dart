import 'package:flutter/material.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';

class StressTestResult {
  final int resultScore;

  StressTestResult({
    @required this.resultScore,
  }) : assert(resultScore != null && resultScore >= 0);

  ResultSet get result {
    ResultSet result;
    if (resultScore >= 0 && resultScore <= 10) {
      result = ResultSet.Normal;
    } else if (resultScore >= 11 && resultScore <= 14) {
      result = ResultSet.Normal;
    } else if (resultScore >= 15 && resultScore <= 21) {
      result = ResultSet.Moderate;
    } else if (resultScore >= 22 && resultScore <= 29) {
      result = ResultSet.Severe;
    } else if (resultScore >= 30) {
      result = ResultSet.ExtremelySevere;
    }
    return result;
  }
}
