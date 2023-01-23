import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_switches/routes/routes_names.dart';

class SplashScreen extends StatelessWidget {
  void endSplash(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboardScreen, (route) => false);
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
