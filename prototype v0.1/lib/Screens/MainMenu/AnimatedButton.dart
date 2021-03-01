import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Color primaryColor;
  final Image assetImage;
  final Text buttonText;
  final Function onTap;
  final double topMargin;

  AnimatedButton(
      {this.primaryColor = Colors.grey,
      this.topMargin = 8,
      @required this.assetImage,
      @required this.buttonText,
      @required this.onTap});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _scaleAnimationController;
  AnimationController _fadeAnimationController;

  Animation<double> _animation;
  Animation<double> _scaleAnimation;
  Animation<double> _fadeAnimation;

  double buttonWidth = 200.0;
  double scale = 1.0;
  double colorOpacity = 0.6;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _fadeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _fadeAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(_fadeAnimationController);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_scaleAnimationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleAnimationController.reverse();
          _fadeAnimationController.forward();
          _animationController.forward();
        }
      });

    _animation = Tween<double>(begin: 0.0, end: buttonWidth)
        .animate(_animationController)
          ..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
    _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      AnimatedBuilder(
        animation: _scaleAnimationController,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: InkWell(
            onTap: () {
              _scaleAnimationController.forward();
              widget.onTap();
            },
            child: Container(
              width: 350.0,
              height: 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: widget.topMargin,
                    ),
                    widget.assetImage,
                    widget.buttonText
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
