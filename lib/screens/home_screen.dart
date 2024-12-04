import 'package:calculator/screens/content_screen.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String number1 = "";
  String operant = "";
  String number2 = "";

  final List<dynamic> data = [
    "AC",
    "⌫",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "00",
    "0",
    ".",
    "="
  ];

  // @override
  // void initState() {
  //   setState(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //print("$number1   $number2  $operator");
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: ContentScreen(
              number1: number1,
              operant: operant,
              number2: number2,
            ),
          ),
          Container(
            width: double.infinity,
            height: 487,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: data.length,
              padding: const EdgeInsets.all(5),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return buttonWidget(
                    context: context, action: data[index], index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
