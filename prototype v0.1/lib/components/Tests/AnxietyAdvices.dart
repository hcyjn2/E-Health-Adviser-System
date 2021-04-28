import 'package:main_menu/components/Tests/Advice.dart';
import 'package:main_menu/components/Tests/TestAdvicesInterface.dart';

//This class is used to initialize all anxiety related advices and randomly pick a a specified amount when requested.
//P.S. this class supports singleton pattern
class AnxietyAdvices extends TestAdvicesInterface {
  /// This parameter holds the only instance of this class.
  static final AnxietyAdvices _instance = AnxietyAdvices._internal();

  factory AnxietyAdvices() {
    return _instance;
  }

  AnxietyAdvices._internal();

  @override
  void initAdviceList() {
    advicesList.add(
      Advice(
          header: 'Follow the 3-3-3 rule.',
          text:
              "Try and follow the 3-3-3 rule, name three things you see, three things you hear, and three parts of your body."),
    );
    advicesList.add(
      Advice(header: 'Breathing exercise', text: "Take some deep breaths."),
    );
    advicesList.add(
      Advice(
          header: 'Reduce sugar intake',
          text:
              "Do not consume any sugar as it increases the severity of the symptoms."),
    );
    advicesList.add(
      Advice(
          header: 'Focus on the present.',
          text:
              "Dwelling on the future and the past are impractical and will only cause the feelings of anxiety to worsen."),
    );
    advicesList.add(
      Advice(
          header: 'Have a balanced diet',
          text:
              "The body needs valuable nutrients so do not skip any meals. Try to keep energy-boosting healthy snacks."),
    );
    advicesList.add(
      Advice(
          header: 'Reduce Alcohol and Caffeine Consumption',
          text:
              "Both alcohol and caffeine aggravate and worsen the symptoms as well as trigger panic attacks."),
    );
    advicesList.add(
      Advice(
          header: 'Discover what triggers your anxiety',
          text:
              "Keeping a journal for when you are stressed and anxious will help in getting to know what causes your anxiety in order for you to avoid it."),
    );
    advicesList.add(
      Advice(
          header: 'Let go',
          text:
              "Accepting the fact that you cannot control everything will give you a sense of more control over your life."),
    );
    advicesList.add(
      Advice(
          header: 'Exercise',
          text:
              "It is proven that exercise help calm down and lessen the symptoms of anxiety. Set small daily goals and go for a jog or walk."),
    );
    advicesList.add(
      Advice(
          header: 'Talk with someone',
          text:
              "Talk about what is on your mind with someone you trust such as a friend or family member."),
    );
    advicesList.add(
      Advice(
          header: 'Meditate',
          text: "Guided meditation is proven to help you cope with anxiety."),
    );
  }
}
