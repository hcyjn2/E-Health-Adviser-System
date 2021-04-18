import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main_menu/components/Help/HelpAudioPlayer.dart';
import 'package:main_menu/components/Help/HelpVideoPlayer.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeablePageWidget.dart';

import '../../constants.dart';

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
    final int randomNumber = Random().nextInt(videoAmount) + 1;
    print(randomNumber);
    _videoName = 'Video' + randomNumber.toString() + '.mp4';
  }
}
