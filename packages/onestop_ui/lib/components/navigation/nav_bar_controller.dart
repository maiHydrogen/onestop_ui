import 'package:flutter/material.dart';

class ONavBarController extends TabController {
  // Use super parameters for cleaner constructor (fixes linter warning)
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

  // Direct public property instead of getter/setter wrapper
  Function(int)? onTabChange;

  // Keep selectTab for convenient programmatic selection
  void selectTab(int index) {
    if (index < 0 || index >= length) return;
    animateTo(index);
    onTabChange?.call(index);
  }

  // Properly annotated override for index setter
  @override
  set index(int index) {
    if (index < 0 || index >= length) return;
    super.index = index;
    onTabChange?.call(index);
  }

  // Inherited getter (no override needed, just alias for clarity)
  int get currentIndex => index;

  @override
  void dispose() {
    onTabChange = null;
    super.dispose();
  }
}
