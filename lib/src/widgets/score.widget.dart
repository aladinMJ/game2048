import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final String label;

  const ScoreWidget({super.key, required this.score, required this.label});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.3; // 30% de la largeur de l'écran
    double containerHeight = screenHeight * 0.07; // 7% de la hauteur de l'écran
    double scoreFontSize =
        screenWidth * 0.06; // Taille de texte basée sur la largeur
    double labelFontSize = screenWidth * 0.05; // Taille de texte pour le label

    return Column(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$score',
              style: TextStyle(
                fontSize: scoreFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: screenHeight * 0.02),
          child: Text(
            label,
            style: TextStyle(
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
