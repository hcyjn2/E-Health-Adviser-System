import 'dart:math';

import 'Advice.dart';

class AnxietyAdvices {
  static final AnxietyAdvices _instance = AnxietyAdvices._internal();
  static List<Advice> _advices = [];
  factory AnxietyAdvices() {
    return _instance;
  }
  List<Advice> getAdvices(int amount) {
    List<int> advicesChosen = [];
    List<Advice> advices = [];
    for (int i = 0; i < amount; i++) {
      int randomIndex = Random().nextInt(_advices.length);
      if (advicesChosen.contains(randomIndex)) {
        i--;
        continue;
      }
      advicesChosen.add(randomIndex);
      advices.add(_advices[randomIndex]);
    }
    return advices;
  }

  AnxietyAdvices._internal() {
    _advices.add(
      Advice(
          header: 'Follow the 3-3-3 rule.',
          text:
              "Try and follow the 3-3-3 rule, name three things you see, three things you hear, and three parts of your body."),
    );
    _advices.add(
      Advice(header: 'Breathing exercise', text: "Take some deep breaths."),
    );
    _advices.add(
      Advice(
          header: 'Reduce sugar intake',
          text:
              "Do not consume any sugar as it increases the severity of the symptoms."),
    );
    _advices.add(
      Advice(
          header: 'Focus on the present.',
          text:
              "Dwelling on the future and the past are impractical and will only cause the feelings of anxiety to worsen."),
    );
    _advices.add(
      Advice(
          header: 'Have a balanced diet',
          text:
              "The body needs valuable nutrients so do not skip any meals. Try to keep energy-boosting healthy snacks."),
    );
    _advices.add(
      Advice(
          header: 'Reduce Alcohol and Caffeine Consumption',
          text:
              "Both alcohol and caffeine aggravate and worsen the symptoms as well as trigger panic attacks."),
    );
    _advices.add(
      Advice(
          header: 'Discover what triggers your anxiety',
          text:
              "Keeping a journal for when you are stressed and anxious will help in getting to know what causes your anxiety in order for you to avoid it."),
    );
    _advices.add(
      Advice(
          header: 'Let go',
          text:
              "Accepting the fact that you cannot control everything will give you a sense of more control over your life."),
    );
    _advices.add(
      Advice(
          header: 'Exercise',
          text:
              "It is proven that exercise help calm down and lessen the symptoms of anxiety. Set small daily goals and go for a jog or walk."),
    );
    _advices.add(
      Advice(
          header: 'Talk with someone',
          text:
              "Talk about what is on your mind with someone you trust such as a friend or family member."),
    );
    _advices.add(
      Advice(
          header: 'Meditate',
          text: "Guided meditation is proven to help you cope with anxiety."),
    );
  }
}
