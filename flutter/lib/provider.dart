import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderClass with ChangeNotifier {
  late ThemeMode themeMode = ThemeMode.system;
  List<bool> _toggles = [false, false, false];
  final dbRef = FirebaseDatabase.instance.reference();
  ProviderClass() {
    getTheme();
    getButtonState();
  }

  List<bool> get toggles => _toggles;

  void dbUpdate(int index) {
    // _toggles[index] = !_toggles[index];
    if (index == 0) {
      if (_toggles[index])
        dbRef.child('Light').set({'switch': '0'});
      else
        dbRef.child('Light').set({'switch': '1'});
    } else
      print('These buttons don\'t do anything as of now');

    notifyListeners();
  }

  void getButtonState() {
    dbRef.child('Light').child('switch').once().then((data) {
      print('the value from db is ${data.value}');
      if (data.value == '1') {
        _toggles[0] = false;
        notifyListeners();
      } else {
        _toggles[0] = true;
        notifyListeners();
      }
    });
  }

  Future<void> onRefreshCall() async {
    final dbRef = FirebaseDatabase.instance.reference();
    dbRef.child('Light').child('switch').once().then((data) {
      print('the value from db is ${data.value}');
      if (data.value == '1') {
        _toggles[0] = false;
        return 'success';
      } else {
        _toggles[0] = true;
        return 'also a success';
      }
    });
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode == ThemeMode.dark
        ? themeMode = ThemeMode.light
        : themeMode = ThemeMode.dark;
    themeMode == ThemeMode.dark
        ? prefs.setString('theme', 'dark')
        : prefs.setString('theme', 'light');
    notifyListeners();
  }

  void toggleSwitch() {}
  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themePref = prefs.getString('theme') ?? 'light';
    themePref == 'light'
        ? themeMode = ThemeMode.light
        : themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
