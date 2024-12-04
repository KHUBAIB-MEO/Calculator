import 'package:calculator/screens/splash_screen.dart';
import 'package:calculator/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caculator",
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
