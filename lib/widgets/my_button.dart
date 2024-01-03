import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;
  MyButton({
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
      color: Colors.yellow,
    );
  }
}
