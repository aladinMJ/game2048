import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  ScoreWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Largeur du carré
      height: 40, // Hauteur du carré
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 197, 161, 150),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$score', // Affiche le score
          style: const TextStyle(
            fontSize: 20, // Taille du texte
            fontWeight: FontWeight.bold,
            color: Colors.white, // Couleur du texte
          ),
        ),
      ),
    );
  }
}
