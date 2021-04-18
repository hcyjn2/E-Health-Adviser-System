import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SwipeDirection { toRight, toLeft }

class SwipeablePageWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    List<Widget> childrenList = [];
    int initPage;
    PageController _pageController;
    if (direction == SwipeDirection.toRight) {
      childrenList.add(Text(''));
      initPage = 1;
    }
    childrenList.add(child);
    if (direction == SwipeDirection.toLeft) {
      childrenList.add(Text(''));
      initPage = 0;
    }
    _pageController = PageController(initialPage: initPage, keepPage: false);
    return PageView(
      controller: _pageController,
      children: childrenList,
      onPageChanged: (int page) {
        onSwipeCallback();
        changePageAnimation(page, _pageController, initPage);
      },
    );
  }

  void changePageAnimation(
      int page, PageController _pageController, int initPage) async {
    await _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    _pageController.jumpToPage(initPage);
  }
}
