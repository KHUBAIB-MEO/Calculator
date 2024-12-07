import 'package:calculator/screens/splash_screen.dart';
import 'package:calculator/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeMode = lightMode; // Default to theme

  void toggleTheme(bool? toggle) {
    setState(() {
      if (toggle == true || toggle == null) {
        themeMode = lightMode;
      } else if (toggle == false) {
        themeMode = darkMode;
      }
      /* toggle = !toggle!;
      print(toggle);*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caculator",
      debugShowCheckedModeBanner: false,
      theme: themeMode,
      home: Scaffold(
        body: SplashScreen(toggleTheme: toggleTheme),
      ),
    );
  }
}
