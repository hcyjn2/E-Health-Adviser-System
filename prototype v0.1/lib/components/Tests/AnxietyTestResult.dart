import 'package:flutter/material.dart';

class AnxietyTestResult {
  final int resultScore;

  AnxietyTestResult({@required this.resultScore}) : assert(resultScore != null);

  String get resultText {
    String resultText;
    if (resultScore <= 5 && resultScore >= 0) {
      resultText = 'Your result is indicative of little or no anxiety levels.';
    } else if (resultScore <= 10 && resultScore >= 6) {
      resultText = 'Your result is indicative of mild anxiety levels.';
    } else if (resultScore <= 15 && resultScore >= 11) {
      resultText = 'Your result is indicative of moderate anxiety levels.';
    } else if (resultScore <= 21 && resultScore >= 16) {
      resultText = 'Your result is indicative of high anxiety levels.';
    }
    return resultText;
  }
}
