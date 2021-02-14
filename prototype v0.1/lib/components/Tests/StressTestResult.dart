import 'package:flutter/material.dart';

class StressTestResult {
  final int resultScore;

  StressTestResult({@required this.resultScore}) : assert(resultScore != null);

  String get resultText {
    String resultText;
    if (resultScore >= 0 && resultScore <= 10) {
      resultText =
          'Your results show that you may be experiencing a Normal level of stress';
    } else if (resultScore >= 11 && resultScore <= 14) {
      resultText =
          'Your results show that you may be experiencing a Mild level of stress';
    } else if (resultScore >= 15 && resultScore <= 21) {
      resultText =
          'Your results show that you may be experiencing a Moderate level of stress';
    } else if (resultScore >= 22 && resultScore <= 29) {
      resultText =
          'Your results show that you may be experiencing a Severe level of stress';
    } else if (resultScore >= 30) {
      resultText =
          'Your results show that you may be experiencing an Extremely Severe level of stress';
    }
    return resultText;
  }
}
