import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final String label;

  const ScoreWidget({super.key, required this.score, required this.label});

  @override
  Widget build(BuildContext context) {
    // Obtenir la taille de l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adapter la largeur et la hauteur du conteneur en fonction de l'écran
    double containerWidth = screenWidth * 0.3; // 30% de la largeur de l'écran
    double containerHeight = screenHeight * 0.07; // 7% de la hauteur de l'écran
    double scoreFontSize = screenWidth * 0.06; // Taille de texte basée sur la largeur
    double labelFontSize = screenWidth * 0.05; // Taille de texte pour le label

    return Column(
      children: [
        Container(
          width: containerWidth, // Largeur adaptative
          height: containerHeight, // Hauteur adaptative
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$score', // Affiche le score
              style: TextStyle(
                fontSize: scoreFontSize, // Taille de texte responsive
                fontWeight: FontWeight.bold,
                color: Colors.white, // Couleur du texte
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: screenHeight * 0.02), // Espacement responsive
          child: Text(
            label,
            style: TextStyle(
              fontSize: labelFontSize, // Taille de texte responsive
              fontWeight: FontWeight.bold,
              color: Colors.black, // Couleur du texte
            ),
          ),
        ),
      ],
    );
  }
}
