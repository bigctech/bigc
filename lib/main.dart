import 'package:bigc/firebase_options.dart';
import 'package:bigc/routes/app_routes.dart';
import 'package:bigc/screens/bottom_navbar_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: const BottomNavbarWrapper(),
      routes: AppRoutes.routes,
    );
  }

  // Custom Theme Object
  ThemeData myTheme() {
    final Color primaryColor = Colors.deepPurpleAccent.shade700;
    const Color secondaryColor = Colors.cyan;
    // final Color darkSecondaryColor = Color(0xFF00937B);
    // final Color surfaceColor = Color(0xffffebe5);
    const Color lightBackground = Colors.white;
    final Color darkBackground = Colors.blueGrey.shade900;
    final Color appBarBackground = Colors.deepPurpleAccent;
    // final Color lightBrown = Color(0xFFbba79c);

    return ThemeData(
      scaffoldBackgroundColor: lightBackground,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: secondaryColor,
        surface: lightBackground,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        foregroundColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: darkBackground),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkBackground,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        fillColor: lightBackground,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2.0,
          ),
        ),
        hintStyle: TextStyle(color: darkBackground),
      ),
      useMaterial3: true,
    );
  }
}
