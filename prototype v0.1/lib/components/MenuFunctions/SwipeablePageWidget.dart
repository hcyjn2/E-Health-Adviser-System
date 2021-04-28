import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Enumeration that defines all the swipe direction options
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
    //Creating a PageView with one empty page and the widget passed to the constructor as a child.
    //This is done to access swipe detector.
    //Note: initPage is set to the screen with the widget passed to a constructor
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
      //Call the function every time swipe is done
      onPageChanged: (int page) {
        //Call function passed to a constructor
        onSwipeCallback();
        //Change from empty screen back to normal page.
        changePageAnimation(page, _pageController, initPage);
      },
    );
  }

  //Animates changing the screen back to initial page
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
