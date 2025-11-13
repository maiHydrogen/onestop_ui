import 'package:flutter/material.dart';

class ONavBarController extends TabController {
 
  ONavBarController({
    int initialIndex = 0,
    Duration? animationDuration,
    required int length,
    required TickerProvider vsync,
  }) : super(
    initialIndex: initialIndex,
    animationDuration: animationDuration,
    length: length,
    vsync: vsync,
  );


  Function(int)? onTabChange;


  void selectTab(int index) {
    if (index < 0 || index >= length) return;
    animateTo(index);
    onTabChange?.call(index);
  }

  @override
  set index(int index) {
    if (index < 0 || index >= length) return;
    super.index = index;
    onTabChange?.call(index);
  }

  int get currentIndex => index;

  @override
  void dispose() {
    onTabChange = null;
    super.dispose();
  }
}
