import 'package:flutter/material.dart';
import 'package:main_menu/components/Tests/TestEnums.dart';

//This class specifies interface for all TestResult classes.
//Test result class supposed to convert numeric result score into appropriate value of ResultSet enum
abstract class TestResultInterface {
  /// Total Score obtained for results
  @protected
  int resultScore;

  /// To be implemented by children
  ResultSet get result;
}
