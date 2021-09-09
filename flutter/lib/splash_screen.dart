//todo: add the splash screen and find an appicon soon
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_switches/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen';

  void endSplash(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, DashboardScreen.id, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    endSplash(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(
                size: 100.0,
                style: FlutterLogoStyle.stacked,
              ),
              SizedBox(width: 60.0, child: LinearProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
