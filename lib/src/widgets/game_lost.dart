//creation de pop up de perte avec un text : GAME OVER !
//avec le gif : https://giphy.com/embed/d2lcHJTG5Tscg
import 'package:flutter/material.dart';

class GameLost extends StatelessWidget {
  const GameLost({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('GAME OVER !'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6, // Limite la largeur à 60% de l'écran
        child: Column(
          mainAxisSize: MainAxisSize.min, // Limite la hauteur au contenu
          children: [
            const Text('You have lost, try again!'),
            const SizedBox(height: 20),
            Image.network(
              'https://media.giphy.com/media/d2lcHJTG5Tscg/giphy.gif',
              height: 150, // Taille fixe de l'image
              fit: BoxFit.contain, // Conserve le ratio de l'image
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
