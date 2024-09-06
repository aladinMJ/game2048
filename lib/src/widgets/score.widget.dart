import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final String label;

  const ScoreWidget({super.key, required this.score, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120, // Largeur du carré
          height: 60, // Hauteur du carré
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$score', // Affiche le score
              style: const TextStyle(
                fontSize: 24, // Taille du texte
                fontWeight: FontWeight.bold,
                color: Colors.white, // Couleur du texte
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Text(label,
              style: const TextStyle(
                fontSize: 20, // Taille du texte
                fontWeight: FontWeight.bold,
                color: Colors.black, // Couleur du texte
              )),
        ),
      ],
    );
  }
}
