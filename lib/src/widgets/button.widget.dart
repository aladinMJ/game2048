import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Récupérer la taille de l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculer la largeur, la hauteur et la taille du texte en fonction de l'écran
    double buttonWidth = screenWidth * 0.4; // 40% de la largeur de l'écran
    double buttonHeight = screenHeight * 0.07; // 7% de la hauteur de l'écran
    double fontSize = screenWidth * 0.05; // Taille du texte basée sur la largeur de l'écran

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth, buttonHeight), // Taille adaptative
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize), // Taille de texte responsive
      ),
    );
  }
}
