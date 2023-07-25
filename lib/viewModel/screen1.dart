import 'package:flutter/material.dart';

class Screen1Provider extends ChangeNotifier {
  String screenName = "";
  String get getScreenName {
    return screenName;
  }

  bool focus = false;
  bool get focusnext {
    return focus;
  }

  void screenChange(String newScreenName) {
    screenName = newScreenName;
    notifyListeners();
  }

  void focusChange(bool newFocus) {
    focus = newFocus;
    notifyListeners();
  }
}
