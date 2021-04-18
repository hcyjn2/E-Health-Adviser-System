import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SwipeDirection { toRight, toLeft }

class SwipeablePageWidget extends StatefulWidget {
  /// The `Widget` on which we want to detect the swipe movement.
  final Widget child;

  /// The `VoidCallback` that will be called once a swipe with certain percentage is detected.
  final VoidCallback onSwipeCallback;

  /// The direction of the swipe
  final SwipeDirection direction;

  SwipeablePageWidget({
    Key key,
    @required this.child,
    @required this.onSwipeCallback,
    this.direction = SwipeDirection.toRight,
  })  : assert(child != null && onSwipeCallback != null && direction != null),
        super(key: key);

  @override
  _SwipeablePageWidgetState createState() => _SwipeablePageWidgetState();
}

class _SwipeablePageWidgetState extends State<SwipeablePageWidget> {
  List<Widget> childrenList = [];
  int initPage;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    if (widget.direction == SwipeDirection.toRight) {
      childrenList.add(Text(''));
      initPage = 1;
    }
    childrenList.add(widget.child);
    if (widget.direction == SwipeDirection.toLeft) {
      childrenList.add(Text(''));
      initPage = 0;
    }
    _pageController = PageController(initialPage: initPage, keepPage: false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void changePageAnimation(int page) async {
    await _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    _pageController.jumpToPage(initPage);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: childrenList,
      onPageChanged: (int page) {
        widget.onSwipeCallback();
        changePageAnimation(page);
      },
    );
  }
}
