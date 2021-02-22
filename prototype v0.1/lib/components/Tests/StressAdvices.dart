import 'dart:math';

class StressAdvices {
  static final StressAdvices _instance = StressAdvices._internal();
  static Map<String, String> _advices = Map();
  factory StressAdvices() {
    return _instance;
  }
  Map<String, String> getAdvices(int amount) {
    List<int> advicesChosen = [];
    Map<String, String> advices = <String, String>{};
    for (int i = 0; i < amount; i++) {
      int randomIndex = Random().nextInt(_advices.length);
      if (advicesChosen.contains(randomIndex)) {
        i--;
        continue;
      }
      advicesChosen.add(randomIndex);
      final String key = _advices.keys.elementAt(randomIndex);
      advices[key] = _advices[key];
    }
    return advices;
  }

  StressAdvices._internal() {
    _advices['Take control of your environment.'] =
        'If the evening news makes you anxious, turn off the TV. If traffic makes you tense, take a longer but less-traveled route. If going to the market is an unpleasant chore, do your grocery shopping online.';
    _advices['Avoid people who stress you out.'] =
        'If someone consistently causes stress in your life, limit the amount of time you spend with that person, or end the relationship.';
    _advices["Learn how to say “no.”"] =
        'Know your limits and stick to them. Whether in your personal or professional life, taking on more than you can handle is a surefire recipe for stress. Distinguish between the “shoulds” and the “musts” and, when possible, say “no” to taking on too much.';
    _advices["Create a balanced schedule."] =
        'All work and no play is a recipe for burnout. Try to find a balance between work and family life, social activities and solitary pursuits, daily responsibilities and downtime.';
    _advices["Reframe problems."] =
        'Try to view stressful situations from a more positive perspective. Rather than fuming about a traffic jam, look at it as an opportunity to pause and regroup, listen to your favorite radio station, or enjoy some alone time.';
    _advices["Practice gratitude."] =
        'When stress is getting you down, take a moment to reflect on all the things you appreciate in your life, including your own positive qualities and gifts. This simple strategy can help you keep things in perspective.';
    _advices["Don’t try to control the uncontrollable."] =
        'Many things in life are beyond our control, particularly the behavior of other people. Rather than stressing out over them, focus on the things you can control such as the way you choose to react to problems.';
    _advices["Share your feelings."] =
        'Expressing what you’re going through can be very cathartic, even if there’s nothing you can do to alter the stressful situation. Talk to a trusted friend or make an appointment with a therapist.';
    _advices["Set aside leisure time."] =
        'Include rest and relaxation in your daily schedule. Don’t allow other obligations to encroach. This is your time to take a break from all responsibilities and recharge your batteries.';
    _advices["Do something you enjoy every day."] =
        'Make time for leisure activities that bring you joy, whether it be stargazing, playing the piano, or working on your bike.';
    _advices["Keep your sense of humor."] =
        'This includes the ability to laugh at yourself. The act of laughing helps your body fight stress in a number of ways.';
    _advices["Don’t over-commit yourself."] =
        'Avoid scheduling things back-to-back or trying to fit too much into one day. All too often, we underestimate how long things will take.';
  }
}
