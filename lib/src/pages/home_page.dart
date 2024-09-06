import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../widgets/score_widget.dart';
import '../widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2 0 4 8', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: CustomText(text: 'Ici la grille'),
          ),
         Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: CustomButton(
              label: 'Restart',
              onPressed: () {
                print('Button Pressed!');
              },
              width: 120,  // Largeur personnalisée du bouton
              height: 40,  // Hauteur personnalisée du bouton
              fontSize: 20, // Taille personnalisée du texte
            ),
          ),
        ),


          Align(
            alignment: Alignment.topRight, // Alignement en haut à droite
            child: Padding(
              padding: const EdgeInsets.all(50.0), // Padding pour un peu d'espace par rapport au bord
              child: ScoreWidget(score: 1242), // Affiche le score en haut à droite
            ),
          ),
          //appel le text_widget pour ecrire le mot 'Score' juste en bas de la score widget
          Align(
            alignment: Alignment.topRight, // Alignement en haut à droite
            child: Padding(
              padding: const EdgeInsets.only(top: 100, right: 53), // Padding pour un peu d'espace par rapport au bord
              //ajout un pading a droite
              
              child: CustomText(text: 'Score'), // Affiche le score en haut à droite
            ),
          ),
          Align(
            alignment: Alignment.topLeft, // Alignement en haut à droite
            child: Padding(
              padding: const EdgeInsets.all(50.0), // Padding pour un peu d'espace par rapport au bord
              child: ScoreWidget(score: 1242), // Affiche le score en haut à droite
            ),
          ),
          //appel le text_widget pour ecrire le mot 'Score' juste en bas de la score widget
          Align(
            alignment: Alignment.topLeft, // Alignement en haut à droite
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 37), // Padding pour un peu d'espace par rapport au bord
              //ajout un pading a droite
              
              child: CustomText(text: 'Best score'), // Affiche le score en haut à droite
            ),
          ),
        ],
      ),
    );
  }
}
