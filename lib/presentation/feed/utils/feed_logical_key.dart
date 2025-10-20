import 'package:flutter/services.dart';

enum FeedLogicalKey {
  left,
  right,
  up,
  down,
  center,
  back;

  static FeedLogicalKey? fromKeyEvent(KeyEvent key) {
    if (key.logicalKey == LogicalKeyboardKey.arrowDown) {
      return down;
    } else if (key.logicalKey == LogicalKeyboardKey.arrowUp) {
      return up;
    } else if (key.logicalKey == LogicalKeyboardKey.arrowLeft) {
      return left;
    } else if (key.logicalKey == LogicalKeyboardKey.arrowRight) {
      return right;
    } else if (key.logicalKey == LogicalKeyboardKey.enter ||
        key.logicalKey == LogicalKeyboardKey.select ||
        key.logicalKey == LogicalKeyboardKey.numpadEnter) {
      return center;
    } else if (key.logicalKey == LogicalKeyboardKey.goBack) {
      return back;
    } else {
      return null;
    }
  }
}
