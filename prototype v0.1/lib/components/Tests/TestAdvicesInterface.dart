import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'Advice.dart';

//This class is an interface for any evaluations (tests). It initializes list of advices in it constructor and returns
//randomly sampled advices when requested
abstract class TestAdvicesInterface {
  /// This parameter stores the list of advices.
  @protected
  List<Advice> advicesList = [];

  //Randomly picking several advices from the list. Amount is specified by input.
  List<Advice> getAdvices(int amount) {
    List<int> advicesChosen = [];
    List<Advice> advices = [];
    for (int i = 0; i < amount; i++) {
      int randomIndex = Random().nextInt(advicesList.length);
      //Making sure every chosen advice is distinct
      if (advicesChosen.contains(randomIndex)) {
        i--;
        continue;
      }
      advicesChosen.add(randomIndex);
      advices.add(advicesList[randomIndex]);
    }
    return advices;
  }

  //Initializing advices in the constructor.
  TestAdvicesInterface() {
    initAdviceList();
  }

  //To be implemented for children
  void initAdviceList();
}
