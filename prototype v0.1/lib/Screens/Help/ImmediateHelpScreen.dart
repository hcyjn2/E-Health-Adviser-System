import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main_menu/components/Help/HelpAudioPlayer.dart';
import 'package:main_menu/components/Help/HelpVideoPlayer.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';
import 'package:main_menu/constants.dart';

/*
This class displays a screen with an animated background and starts a prerecorded audio message.
 */
class ImmediateHelpScreen extends StatefulWidget {
  ImmediateHelpScreenState createState() => ImmediateHelpScreenState();
}

class ImmediateHelpScreenState extends State<ImmediateHelpScreen>
    with SingleTickerProviderStateMixin, MenuFunction {
  String _videoName;

  Widget build(BuildContext context) {
    return SwipeablePageWidget(
      onSwipeCallback: () {
        returnBack(context);
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              //Using HelpVideoPlayer to display a nature scenery video as an animated background
              child: HelpVideoPlayer(
                name: _videoName,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      //Use HelpAudioPlayer to start the audio from assets path provided
                      child: HelpAudioPlayer(
                        assetsAudioPath: 'Audios/song1.mp3',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    //picking a random video to use as an animated background
    final int randomNumber = Random().nextInt(videoAmount) + 1;
    print(randomNumber);
    _videoName = 'Video' + randomNumber.toString() + '.mp4';
  }
}
