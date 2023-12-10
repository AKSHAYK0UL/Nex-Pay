import 'package:flutter/material.dart';

class UpiPin with ChangeNotifier {
  final Password = "12345";
  bool CheckPassword(String pin) {
    if (pin == Password) {
      return true;
    }
    return false;
  }

  bool show = true;
  void showPassword() {
    show = !show;
    notifyListeners();
  }
}
