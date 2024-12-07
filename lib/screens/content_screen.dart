import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  final String number1;
  final String operant;
  final String number2;
  final bool toggle = true;
  final void Function(bool?) toggleTheme;
  const ContentScreen(
      {super.key,
      required this.number1,
      required this.operant,
      required this.number2,
      required this.toggleTheme});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print("hello");
              toggleTheme(toggle);
              print("Khubaib $toggle");
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 8),
              child: Text(
                "Mode",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65.0),
                    child: Text(
                      "$number1$operant$number2".isEmpty
                          ? "0"
                          : "$number1$operant$number2",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
