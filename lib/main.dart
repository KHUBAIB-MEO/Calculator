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
  ThemeData themeMode = lightMode; // Default to light mode

  void toggleTheme(bool? toggle) {
    setState(() {
      print(toggle);
      if (toggle == true || toggle == null) {
        print("enter");
        themeMode = lightMode;
        toggle = false;
        print(toggle);
      } else if (toggle == false) {
        themeMode = darkMode;
        toggle = true;
      }
      toggle = !toggle!;
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
