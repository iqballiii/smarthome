import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_switches/dashboard/dashboard_screen.dart';
import 'package:smart_switches/firebase_provider.dart';
import 'package:smart_switches/routes/routes_names.dart';
import 'package:smart_switches/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirebaseProviderClass(),
      child: Consumer<FirebaseProviderClass>(
        builder: (context, data, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: data.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: Routes.splashScreen,
          routes: {
            Routes.splashScreen: (context) => SplashScreen(),
            Routes.dashboardScreen: (context) => DashboardScreen()
          },
        ),
      ),
    );
  }
}

// ThemeData lightTheme = ThemeData();
// ThemeData darkTheme = ThemeData();
