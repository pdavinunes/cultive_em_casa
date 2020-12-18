import 'package:flutter/material.dart';

class ChangeProvider extends ChangeNotifier {
  
  Future<void> refresh() async {
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
  }

}