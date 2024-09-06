import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize; // Nouvelle propriété pour la taille du texte

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 150,
    this.height = 50,
    this.fontSize = 16, // Valeur par défaut de la taille du texte
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height), // Définit la taille du bouton
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize), // Taille du texte modifiable
      ),
    );
  }
}
