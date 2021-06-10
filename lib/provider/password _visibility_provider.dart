
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier{

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off_outlined;
    notifyListeners();
  }
}