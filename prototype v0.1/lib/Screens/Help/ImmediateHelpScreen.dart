import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main_menu/components/Help/HelpAudioPlayer.dart';
import 'package:main_menu/components/MenuFunctions/MenuFunction.dart';
import 'package:main_menu/components/MenuFunctions/SwipeableWidget.dart';

class ImmediateHelpScreen extends StatefulWidget {
  ImmediateHelpScreenState createState() => ImmediateHelpScreenState();
}

class ImmediateHelpScreenState extends State<ImmediateHelpScreen>
    with SingleTickerProviderStateMixin, MenuFunction {
  static const int amountOfSlides = 8;
  int currentSlideNumber;
  Image currentSlide;
  int nextSlide;
  Timer _timer;
  AnimationController _controller;
  Animation _fadeAnimation;
  List<Image> slidesForAnimation = new List<Image>();

  Widget build(BuildContext context) {
    return SwipeableWidget(
      height: double.infinity,
      onSwipeCallback: () {
        returnBack(context);
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Immediate Help')),
        body: Stack(
          children: <Widget>[
            ...slidesForAnimation,
            FadeTransition(
              opacity: _fadeAnimation,
              child: currentSlide,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: HelpAudioPlayer(),
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

  void changeBackgroundImage(Timer t) async {
    setState(() {
      final int prevSlideNumber = currentSlideNumber;
      final Image prevSlide = currentSlide;
      while (currentSlideNumber == prevSlideNumber ||
          currentSlideNumber == slidesForAnimation.length - 1)
        currentSlideNumber = Random().nextInt(8);
      currentSlide = slidesForAnimation[currentSlideNumber];
      slidesForAnimation.removeAt(currentSlideNumber);
      slidesForAnimation.insert(0, prevSlide);
      _controller.reset();
      _controller.forward();
    });
  }

  void initState() {
    super.initState();
    for (int i = amountOfSlides; i > 0; i--) {
      final Image image = Image.asset(
        'assets/images/Slide$i.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        gaplessPlayback: true,
      );
      slidesForAnimation.add(image);
    }
    currentSlideNumber = slidesForAnimation.length - 1;
    currentSlide = slidesForAnimation[currentSlideNumber];
    slidesForAnimation.removeLast();
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 9999),
    )..forward();
    _fadeAnimation = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    _timer =
        new Timer.periodic(const Duration(seconds: 10), changeBackgroundImage);
  }

  /*
  @override
  void didChangeDependencies() {
    slidesForAnimation.forEach((image) {
      precacheImage(image.image, context);
    });
    super.didChangeDependencies();
  }
  */
  @override
  void deactivate() {
    _timer.cancel();
    _controller.stop();
    super.deactivate();
  }
}
