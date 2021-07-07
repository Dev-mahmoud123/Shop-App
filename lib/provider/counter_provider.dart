import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count = 1;
  bool switchValue = false;

  void increment({int id}) {
    count++;
    notifyListeners();
  }

  void decrement({int id}) {
    if (count <= 1) {
      count = 1;
    }
    count--;
    notifyListeners();
  }
}


