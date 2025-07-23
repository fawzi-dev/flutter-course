import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int stateCounter = 0;

  void increase() {
    stateCounter++;
    notifyListeners();
  }

  void decrease() {
    stateCounter--;
    notifyListeners();
  }
}
