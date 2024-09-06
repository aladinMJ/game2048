import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const StyledButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 20)),
    );
  }
}
