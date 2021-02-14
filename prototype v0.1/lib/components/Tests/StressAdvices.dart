import 'dart:math';

class StressAdvices {
  static final StressAdvices _instance = StressAdvices._internal();
  static List<String> _advices = [];
  factory StressAdvices() {
    return _instance;
  }
  String getAdvices(int amount) {
    List<int> advicesChosen = [];
    String advices = "";
    for (int i = 0; i < amount; i++) {
      int randomIndex = Random().nextInt(_advices.length);
      if (advicesChosen.contains(randomIndex)) {
        i--;
        continue;
      }
      advicesChosen.add(randomIndex);
      advices += _advices[randomIndex] + '\n';
    }
    return advices;
  }

  StressAdvices._internal() {
    _advices.add('Be aware of smoking and drinking.');
    _advices.add('Try to exercise.');
    _advices.add('Take your time to relax.');
    _advices.add('Get some restful sleep');
  }
}
