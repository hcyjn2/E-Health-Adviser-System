import 'package:main_menu/components/Tests/TestAdvicesInterface.dart';

import 'Advice.dart';

//This class is used to initialize all stress related advices and randomly pick a a specified amount when requested.
//P.S. this class supports singleton pattern
class StressAdvices extends TestAdvicesInterface {
  /// This parameter holds the only instance of this class.
  static final StressAdvices _instance = StressAdvices._internal();

  factory StressAdvices() {
    return _instance;
  }

  StressAdvices._internal();

  @override
  void initAdviceList() {
    advicesList.add(
      Advice(
          header: 'Take control of your environment.',
          text:
              'If the evening news makes you anxious, turn off the TV. If traffic makes you tense, take a longer but less-traveled route. If going to the market is an unpleasant chore, do your grocery shopping online.'),
    );
    advicesList.add(
      Advice(
          header: 'Avoid people who stress you out.',
          text:
              'If someone consistently causes stress in your life, limit the amount of time you spend with that person, or end the relationship.'),
    );
    advicesList.add(
      Advice(
          header: "Learn how to say “no.”",
          text:
              'Know your limits and stick to them. Whether in your personal or professional life, taking on more than you can handle is a surefire recipe for stress. Distinguish between the “shoulds” and the “musts” and, when possible, say “no” to taking on too much.'),
    );
    advicesList.add(
      Advice(
          header: "Create a balanced schedule.",
          text:
              'All work and no play is a recipe for burnout. Try to find a balance between work and family life, social activities and solitary pursuits, daily responsibilities and downtime.'),
    );
    advicesList.add(
      Advice(
          header: "Reframe problems.",
          text:
              'Try to view stressful situations from a more positive perspective. Rather than fuming about a traffic jam, look at it as an opportunity to pause and regroup, listen to your favorite radio station, or enjoy some alone time.'),
    );
    advicesList.add(
      Advice(
          header: "Practice gratitude.",
          text:
              'When stress is getting you down, take a moment to reflect on all the things you appreciate in your life, including your own positive qualities and gifts. This simple strategy can help you keep things in perspective.'),
    );
    advicesList.add(
      Advice(
          header: "Don’t try to control the uncontrollable.",
          text:
              'Many things in life are beyond our control, particularly the behavior of other people. Rather than stressing out over them, focus on the things you can control such as the way you choose to react to problems.'),
    );
    advicesList.add(
      Advice(
          header: "Share your feelings.",
          text:
              'Expressing what you’re going through can be very cathartic, even if there’s nothing you can do to alter the stressful situation. Talk to a trusted friend or make an appointment with a therapist.'),
    );
    advicesList.add(
      Advice(
          header: "Set aside leisure time.",
          text:
              'Include rest and relaxation in your daily schedule. Don’t allow other obligations to encroach. This is your time to take a break from all responsibilities and recharge your batteries.'),
    );
    advicesList.add(
      Advice(
          header: "Do something you enjoy every day.",
          text:
              'Make time for leisure activities that bring you joy, whether it be stargazing, playing the piano, or working on your bike.'),
    );
    advicesList.add(
      Advice(
          header: "Keep your sense of humor.",
          text:
              'This includes the ability to laugh at yourself. The act of laughing helps your body fight stress in a number of ways.'),
    );
    advicesList.add(
      Advice(
          header: "Don’t over-commit yourself.",
          text:
              'Avoid scheduling things back-to-back or trying to fit too much into one day. All too often, we underestimate how long things will take.'),
    );
  }
}
