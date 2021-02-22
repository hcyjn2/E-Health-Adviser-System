import 'dart:math';

class AnxietyAdvices {
  static final AnxietyAdvices _instance = AnxietyAdvices._internal();
  static Map<String, String> _advices = Map();
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
    _advices['Follow the 3-3-3 rule'] =
        "Try and follow the 3-3-3 rule, name three things you see, three things you hear, and three parts of your body.";
    _advices['Breathing exercise'] = "Take some deep breaths.";
    _advices['Reduce sugar intake'] =
        "Do not consume any sugar as it increases the severity of the symptoms.";
    _advices['Focus on the present.'] =
        "Dwelling on the future and the past are impractical and will only cause the feelings of anxiety to worsen.";
    _advices['Have a balanced diet'] =
        "The body needs valuable nutrients so do not skip any meals. Try to keep energy-boosting healthy snacks.";
    _advices['Reduce Alcohol and Caffeine Consumption'] =
        "Both alcohol and caffeine aggravate and worsen the symptoms as well as trigger panic attacks.";
    _advices['Discover what triggers your anxiety'] =
        "Keeping a journal for when you are stressed and anxious will help in getting to know what causes your anxiety in order for you to avoid it.";
    _advices['Let go'] =
        "Accepting the fact that you cannot control everything will give you a sense of more control over your life.";
    _advices['Exercise'] =
        "It is proven that exercise help calm down and lessen the symptoms of anxiety. Set small daily goals and go for a jog or walk.";
    _advices['Talk with someone'] =
        "Talk about what is on your mind with someone you trust such as a friend or family member.";
    _advices['Meditate'] =
        "Guided meditation is proven to help you cope with anxiety.";
  }
}
