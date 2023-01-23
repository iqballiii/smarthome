import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProviderClass with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  List<bool> _toggles = [false, false, false];
  final dbRef = FirebaseDatabase.instance.ref();
  FirebaseProviderClass() {
    getTheme();
    getButtonState();
  }

  List<bool> get toggles => _toggles;

  void dbUpdate(int index) {
    // _toggles[index] = !_toggles[index];
    switch (index) {
      case 0:
        if (_toggles[0])
          dbRef.child('Light').update({'switch1': '0'});
        else
          dbRef.child('Light').update({'switch1': '1'});
        break;
      case 1:
        if (_toggles[1])
          dbRef.child('Light').update({'switch2': '0'});
        else
          dbRef.child('Light').update({'switch2': '1'});
        break;
      // case 2:
      //   print('Third button\'s functionality yet to be added');
      //   break;
      default:
        print('Third button doesn\'t do anything as of now');
    }
    notifyListeners();
  }

  void getButtonState() {
    dbRef.child('Light').child('switch1').once().then((data) {
      print('the value from db is ${data.snapshot.value}');
      if (data.snapshot.value == '1') {
        _toggles[0] = false;
        notifyListeners();
      } else {
        _toggles[0] = true;
        notifyListeners();
      }
    });
    dbRef.child('Light').child('switch2').once().then((data) {
      print('the value from db is ${data.snapshot.value}');
      if (data.snapshot.value == '1') {
        _toggles[1] = false;
        notifyListeners();
      } else {
        _toggles[1] = true;
        notifyListeners();
      }
    });
  }

  Future<void> onRefreshCall() async {
    final dbRef = FirebaseDatabase.instance.ref();
    dbRef.child('Light').child('switch1').once().then((data) {
      print('the value from db is ${data.snapshot.value}');
      if (data.snapshot.value == '1') {
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
