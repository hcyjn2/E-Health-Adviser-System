import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedButton extends StatefulWidget {
  final Color primaryColor;
  final String textDisplayed;
  final Function onTap;

  AnimatedButton(
      {this.primaryColor = Colors.grey,
      @required this.textDisplayed,
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

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _fadeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_fadeAnimationController);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_scaleAnimationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleAnimationController.reverse();
          _fadeAnimationController.reverse();
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
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: InkWell(
              onTap: () {
                _scaleAnimationController.forward();
                _fadeAnimationController.forward();
                widget.onTap();
              },
              child: Container(
                width: 350.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: widget.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '${widget.textDisplayed}',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 4, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

//This class is just for testing purposes/placeholder page
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Healthier"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),
        )
    );
  }
}
