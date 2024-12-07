import 'package:calculator/screens/content_screen.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final void Function(bool?) toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String number1 = "";
  String operant = "";
  String operantchar = "";
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

  //------------------------------PERCENTAGE FUNCTION------------------//
  void percentage() {
    if (number1.isNotEmpty && operant.isNotEmpty && number2.isNotEmpty) {
      // calculate equation//
      calculateEquation();
      //convert to percentage//
      final num = double.parse(number1);
      setState(() {
        operant = "";
        number2 = "";
        number1 = "${num / 100}";
      });
    } else if (operant.isNotEmpty && number2.isEmpty) {
      // 123+ this is the case
      // can not calculate
    } else if (number1.isNotEmpty) {
      final num = double.parse(number1);
      setState(() {
        operant = "";
        number2 = "";
        number1 = "${num / 100}";
      });
    }
  }

  //------------------------------DELETE FUNCTION------------------//
  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operant.isNotEmpty) {
      operant = operant.substring(0, operant.length - 1);
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    } else if (number1.isEmpty) {}
    setState(() {});
  }

  //-------------------CALCULATE EQUATION FUNCTION------------------//

  void calculateEquation() {
    if (number2.isEmpty || operant.isEmpty || number1.isEmpty) {
      // number1 is empty there is nothing to solve//
      // operant is empty (123 ) if this is the case can not calculate//
      // number 2 is empty (123 + ) if this is the case can not calculate//
      return;
    } else {
      final num1 = double.parse(number1);
      final num2 = double.parse(number2);
      if (operant == "+") {
        number1 = "${num1 + num2}";
      } else if (operant == "-") {
        number1 = "${num1 - num2}";
      } else if (operant == "x") {
        number1 = "${num1 * num2}";
      } else if (operant == "÷") {
        number1 = "${num1 / num2}";
      }
    }
    setState(() {
      if (number1.endsWith(".0")) {
        // if answer  = 2.0 => 2
        number1 = number1.substring(0, number1.length - 2);
      }
      number2 = "";
      operant = "";
    });
  }

  void calculate(String action) {
    if (action == "⌫") {
      delete();
      return;
    } else if (action == "AC") {
      number1 = "";
      number2 = "";
      operant = "";
      setState(() {});
      return;
    }
    if (action == "%") {
      percentage();
      return;
    }
    if (action == "=") {
      calculateEquation();
      return;
    }
    if (action != "." && int.tryParse(action) == null) {
      if (operant.isNotEmpty && number2.isNotEmpty) {
        //calculation
        calculateEquation();
      }
      operant = action;
    } else if (number1.isEmpty || operant.isEmpty) {
      if (action == "." && number1.contains(".")) return;
      if (action == "." && (number1.isEmpty || number1 == "0")) {
        action = "0.";
      }
      number1 = number1 + action;
    } else if (number2.isEmpty || operant.isNotEmpty) {
      if (action == "." && number2.contains(".")) return;
      if (action == "." && (number2.isEmpty || number2 == "0")) {
        action = "0.";
      }
      number2 = number2 + action;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
              toggleTheme: widget.toggleTheme,
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
                  context: context,
                  action: data[index],
                  index: index,
                  number1: number1,
                  number2: number2,
                  operant: operant,
                  onTap: calculate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
