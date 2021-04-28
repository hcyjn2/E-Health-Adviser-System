import 'package:main_menu/components/Tests/TestEnums.dart';
import 'package:main_menu/components/Tests/TestResultInterface.dart';

//This class converts numeric result score of anxiety test into appropriate value of ResultSet enum.
class AnxietyTestResult extends TestResultInterface {
  AnxietyTestResult(int resultScore) : assert(resultScore >= 0) {
    this.resultScore = resultScore;
  }

  //int to ResultSet conversion
  @override
  ResultSet get result {
    ResultSet result;
    if (resultScore <= 5 && resultScore >= 0) {
      result = ResultSet.Normal;
    } else if (resultScore <= 10 && resultScore >= 6) {
      result = ResultSet.Mild;
    } else if (resultScore <= 15 && resultScore >= 11) {
      result = ResultSet.Moderate;
    } else if (resultScore <= 21 && resultScore >= 16) {
      result = ResultSet.High;
    }
    return result;
  }
}
