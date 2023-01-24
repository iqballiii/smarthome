import 'package:flutter/material.dart';

BoxDecoration neoLightOff = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      offset: Offset(4.0, 4.0),
      blurRadius: 2.0,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: Colors.white,
      offset: Offset(-2.0, -2.0),
      blurRadius: 2.0,
      spreadRadius: 1.0,
    ),
  ],
  borderRadius: BorderRadius.circular(15.0),
);
BoxDecoration neoLightOn = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.black.withOpacity(0.09),
    boxShadow: [
      BoxShadow(
          color: Colors.white,
          offset: Offset(2.0, 2.0),
          blurRadius: 2,
          spreadRadius: -1.0),
    ]);

ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xff292d32),
    appBarTheme: AppBarTheme(color: Color(0xff292d32)),
    backgroundColor: Color(0xff292d32),
    scaffoldBackgroundColor: Color(0xff292d32),
    shadowColor: Color(0xff2A2D32),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xffECF0F3),
      ),
      headline5: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff292d32),
      onPrimary: Color(0xff292d32),
      secondary: Color(0xffECF0F3),
      onSecondary: Color(0xffECF0F3),
      error: Colors.red,
      onError: Colors.red,
      background: Color(0xff292d32),
      onBackground: Color(0xff292d32),
      surface: Color(0xff292d32),
      onSurface: Color(0xff292d32),
    ),
    // accentColor: Color(0xffECF0F3),
    iconTheme: IconThemeData(
      color: Color(0xffECF0F3),
    ));

ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Color(0xffECF0F3)),
    scaffoldBackgroundColor: Color(0xffECF0F3),
    backgroundColor: Color(0xffECF0F3),
    primaryColor: Color(0xffECF0F3),
    shadowColor: Colors.black.withOpacity(0.09),
    textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0xff394C70),
        ),
        headline5: TextStyle(color: Colors.grey[800], fontSize: 16.0)),
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffECF0F3),
      onPrimary: Color(0xffECF0F3),
      secondary: Color(0xff394C70),
      onSecondary: Color(0xff394C70),
      error: Colors.red,
      onError: Colors.red,
      background: Color(0xffECF0F3),
      onBackground: Color(0xffECF0F3),
      surface: Color(0xffECF0F3),
      onSurface: Color(0xffECF0F3),
    ),
    // accentColor: Color(0xff394C70),
    iconTheme: IconThemeData(color: Color(0xff394C70)));
