import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_switches/dashboard_screen.dart';
import 'package:smart_switches/provider.dart';
import 'package:smart_switches/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: Consumer<ProviderClass>(
        builder: (context, data, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: data.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            DashboardScreen.id: (context) => DashboardScreen()
          },
        ),
      ),
    );
  }
}

// ThemeData lightTheme = ThemeData();
// ThemeData darkTheme = ThemeData();
