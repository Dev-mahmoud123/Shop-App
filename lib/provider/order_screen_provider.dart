import 'package:flutter/material.dart';

class OrderScreenProvider extends ChangeNotifier {
  int groupValue = 1;
  bool switchValue= false;

  void handleRadio(int value) {
    groupValue = value;
    notifyListeners();
  }

  void handleSwitch(bool value){
    switchValue = value;
    notifyListeners();
  }

}
