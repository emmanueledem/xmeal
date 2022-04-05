import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserVisiting extends ChangeNotifier {
  bool? alreadyVisited;

  void changeStatus() {
    alreadyVisited = true;
    notifyListeners();
    setVisitingFlag();
  }

  setVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyvisited', alreadyVisited!);
  }

  getVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyVisited = prefs.getBool('alreadyvisited') ?? false;
    return alreadyVisited;
  }
}
