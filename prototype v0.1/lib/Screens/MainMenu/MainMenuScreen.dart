import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AnimatedButton.dart';
import 'MainMenuDrawer.dart';
import 'ReusableMainMenuCard.dart';


class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Healthier"),
      ),
      drawer: MainMenuDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedButton(Color.fromRGBO(57, 92, 249, 1),"Local Clinic",1),
              AnimatedButton(Colors.yellow[700],"Test",2),
              AnimatedButton(Colors.green[400],"MoodTracker",3),
              AnimatedButton(Colors.red[700],"Diary",4),
              //Mood Select
              Container(
                //MoodTracker Test
                  child: ReusableMainMenuCard(
                    mainMenuCard: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                onTap: () {
                                  print("one");
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.laughBeam,
                                )
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                print("two");
                              },
                              child: FaIcon(
                                FontAwesomeIcons.smile,
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                print("three");
                              },
                              child: FaIcon(
                                FontAwesomeIcons.meh,
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                print("four");
                              },
                              child: FaIcon(
                                FontAwesomeIcons.frown,
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                print("five");
                              },
                              child: FaIcon(
                                FontAwesomeIcons.angry,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}