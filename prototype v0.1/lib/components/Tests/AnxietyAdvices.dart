import 'dart:math';

class AnxietyAdvices {
  static final AnxietyAdvices _instance = AnxietyAdvices._internal();
  static List<String> _advices = [];
  factory AnxietyAdvices() {
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

  AnxietyAdvices._internal() {
    _advices.add('Take some deep breaths.');
    _advices.add(
        'Try and follow the 3-3-3 rule, name three things you see, three things you hear, and three parts of your body.');
    _advices.add('Do not consume any sugar.');
    _advices.add('Focus on the present.');
  }
}
