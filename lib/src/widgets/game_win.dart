//creation d'un pop up gagnant avec un text : GAME OVER !
// avec le gif : https://giphy.com/embed/ZhITVoyCVDZrpI5rcn

import 'package:flutter/material.dart';

class GameWin extends StatelessWidget {
  const GameWin({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('YOU WIN !'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6, // Limite la largeur à 60% de l'écran
        child: Column(
          mainAxisSize: MainAxisSize.min, // Limite la hauteur au contenu
          children: [
            const Text('You have won, congratulations!'),
            const SizedBox(height: 20),
            Image.network(
              'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExcW82YXMwamE3MTZkeGZtb2ZnNjA4dmo0eHhweXNqNW0xbHQxdHhuYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JV7GuEriVvMk921YaA/giphy.gif',
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
