import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  final String number1;
  final String operant;
  final String number2;
  final void Function(bool?) toggleTheme;
  const ContentScreen(
      {super.key,
      required this.number1,
      required this.operant,
      required this.number2,
      required this.toggleTheme});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  bool toggle = true;

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
              widget.toggleTheme(toggle);
              setState(() {
                toggle = !toggle;
              });
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
                      "${widget.number1}${widget.operant}${widget.number2}"
                              .isEmpty
                          ? "0"
                          : "${widget.number1}${widget.operant}${widget.number2}",
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
