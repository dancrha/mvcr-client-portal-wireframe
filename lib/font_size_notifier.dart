import 'package:flutter/material.dart';

class FontSizeProvider extends ChangeNotifier {
  double _fontSize = 16;
  double _headerFontSize = 32;

  double get fontSize => _fontSize;
  double get headerFontSize => _headerFontSize;

  void setFontSize(double newFontSize, double newHeaderFontSize) {
    if (newFontSize > 12 &&
        newFontSize < 20 &&
        newHeaderFontSize > 28 &&
        newHeaderFontSize < 36) {
      _fontSize = newFontSize;
      _headerFontSize = newHeaderFontSize;
      notifyListeners();
    }
  }
}
