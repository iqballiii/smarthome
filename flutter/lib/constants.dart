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
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: Color(0xff292d32)),
    backgroundColor: Color(0xff292d32),
    scaffoldBackgroundColor: Color(0xff292d32),
    shadowColor: Color(0xff2A2D32),
    textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0xffECF0F3),
        ),
        headline5: TextStyle(color: Colors.white, fontSize: 16.0),
        subtitle1: TextStyle(
          color: Colors.white,
        )),
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
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff292d32),
        disabledColor: Colors.grey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
    // accentColor: Color(0xffECF0F3),
    iconTheme: IconThemeData(
      color: Color(0xffECF0F3),
    ));

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: Color(0xffECF0F3)),
    scaffoldBackgroundColor: Color(0xffECF0F3),
    backgroundColor: Color(0xffECF0F3),
    primaryColor: Color(0xffECF0F3),
    shadowColor: Colors.black.withOpacity(0.09),
    textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Color(0xff394C70),
        ),
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

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFA33E00),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBCD),
  onPrimaryContainer: Color(0xFF360F00),
  secondary: Color(0xFF0D61A4),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD2E4FF),
  onSecondaryContainer: Color(0xFF001C37),
  tertiary: Color(0xFFB62229),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDAD7),
  onTertiaryContainer: Color(0xFF410004),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF8FDFF),
  onBackground: Color(0xFF001F25),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  surfaceVariant: Color(0xFFF5DED5),
  onSurfaceVariant: Color(0xFF53443D),
  outline: Color(0xFF85736C),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFFFFB596),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA33E00),
  // outlineVariant: Color(0xFFD8C2BA),
  // scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB596),
  onPrimary: Color(0xFF581E00),
  primaryContainer: Color(0xFF7C2E00),
  onPrimaryContainer: Color(0xFFFFDBCD),
  secondary: Color(0xFFA0C9FF),
  onSecondary: Color(0xFF00325A),
  secondaryContainer: Color(0xFF00497F),
  onSecondaryContainer: Color(0xFFD2E4FF),
  tertiary: Color(0xFFFFB3AE),
  onTertiary: Color(0xFF68000B),
  tertiaryContainer: Color(0xFF930015),
  onTertiaryContainer: Color(0xFFFFDAD7),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F25),
  onBackground: Color(0xFFA6EEFF),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceVariant: Color(0xFF53443D),
  onSurfaceVariant: Color(0xFFD8C2BA),
  outline: Color(0xFFA08D85),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFFA33E00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB596),
  // outlineVariant: Color(0xFF53443D),
  // scrim: Color(0xFF000000),
);
