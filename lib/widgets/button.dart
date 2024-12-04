import 'package:flutter/material.dart';

Widget buttonWidget({
  required BuildContext context,
  var action,
  required int index,
  required String number1,
  required String number2,
  required String operant,
  required void Function(String) onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: () {
        print(action);
        onTap(action);
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            action,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
    ),
  );
}
