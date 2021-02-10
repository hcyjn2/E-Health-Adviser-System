import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SwipeDirection { toRight, toLeft }

class SwipeableWidget extends StatefulWidget {
  /// The `Widget` on which we want to detect the swipe movement.
  final Widget child;

  /// The Height of the widget that will be drawn, required.
  final double height;

  /// The `VoidCallback` that will be called once a swipe with certain percentage is detected.
  final VoidCallback onSwipeCallback;

  /// The decimal percentage of swiping in order for the callbacks to get called, defaults to 0.75 (75%) of the total width of the children.
  final double swipePercentageNeeded;

  //The direction of the swipe
  final SwipeDirection direction;

  SwipeableWidget(
      {Key key,
      @required this.child,
      @required this.height,
      @required this.onSwipeCallback,
      this.direction = SwipeDirection.toRight,
      this.swipePercentageNeeded = 0.50})
      : assert(child != null &&
            onSwipeCallback != null &&
            swipePercentageNeeded <= 1.0 &&
            direction != null),
        super(key: key);

  @override
  _SwipeableWidgetState createState() => _SwipeableWidgetState();
}

class _SwipeableWidgetState extends State<SwipeableWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Alignment alignmentDirection;
  double _dxStartPosition = 0.0;
  double _dxEndsPosition = 0.0;

  @override
  void initState() {
    super.initState();
    alignmentDirection = widget.direction == SwipeDirection.toRight
        ? Alignment.centerRight
        : Alignment.centerLeft;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _controller.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStartHandle,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: widget.height,
        alignment: alignmentDirection,
        child: FractionallySizedBox(
          widthFactor: _controller.value,
          heightFactor: 1.0,
          child: OverflowBox(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _controller.stop();
    super.deactivate();
  }

  void _onPanStartHandle(DragStartDetails details) {
    setState(() {
      _dxStartPosition = details.localPosition.dx;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final widgetSize = context.size.width;

    bool swipeValid;
    if (widget.direction == SwipeDirection.toRight) {
      // will only animate the swipe if user start the swipe in the quarter half start page of the widget
      final minimumXToStartSwiping = widgetSize * 0.25;

      swipeValid = _dxStartPosition <= minimumXToStartSwiping;
    } else {
      // will only animate the swipe if user start the swipe in the last quarter of the page of the widget
      final minimumXToStartSwiping = widgetSize * 0.75;

      swipeValid = _dxStartPosition >= minimumXToStartSwiping &&
          _dxStartPosition <= widgetSize;
    }

    if (swipeValid) {
      setState(() {
        _dxEndsPosition = details.localPosition.dx;
      });

      // update the animation value according to user's pan update
      final widgetSize = context.size.width;
      _controller.value =
          _calcControllerValue((details.localPosition.dx), widgetSize);
    }
  }

  void _onPanEnd(DragEndDetails details) async {
    // checks if the right swipe that user has done is enough or not
    final delta = _calcDelta(_dxStartPosition, _dxEndsPosition);
    final widgetSize = context.size.width;
    final deltaNeededToBeSwiped = widgetSize * widget.swipePercentageNeeded;
    if (delta > deltaNeededToBeSwiped) {
      // if it's enough, then animate to hide them
      _controller.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      _controller.animateTo(1.0,
          duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      widget.onSwipeCallback();
    } else {
      // if it's not enough, then animate it back to its full width
      _controller.animateTo(1.0,
          duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
    }
  }

  double _calcDelta(double startPos, double endPos) {
    return widget.direction == SwipeDirection.toRight
        ? _dxEndsPosition - _dxStartPosition
        : _dxStartPosition - _dxEndsPosition;
  }

  double _calcControllerValue(double localPos, double widgetSize) {
    return widget.direction == SwipeDirection.toRight
        ? 1 - (localPos / widgetSize)
        : (localPos / widgetSize);
  }
}
