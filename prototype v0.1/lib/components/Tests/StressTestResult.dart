import 'package:main_menu/components/Tests/TestEnums.dart';
import 'package:main_menu/components/Tests/TestResultInterface.dart';

//This class converts numeric result score of stress test into appropriate value of ResultSet enum.
class StressTestResult extends TestResultInterface {
  StressTestResult(resultScore) : assert(resultScore >= 0) {
    this.resultScore = resultScore;
  }

  //int to ResultSet conversion
  @override
  ResultSet get result {
    ResultSet result;
    if (resultScore >= 0 && resultScore <= 10) {
      result = ResultSet.Normal;
    } else if (resultScore >= 11 && resultScore <= 14) {
      result = ResultSet.Mild;
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
