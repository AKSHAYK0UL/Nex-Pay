import 'package:flutter/material.dart';
import 'dart:io';

class NetworkModel with ChangeNotifier {
  bool isinternet = false;

  void get checkInternetConnection async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isinternet = true;
      }
    } on SocketException catch (_) {
      isinternet = false;
    }
    notifyListeners();
  }
}
