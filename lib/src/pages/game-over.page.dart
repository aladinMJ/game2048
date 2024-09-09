import 'package:flutter/material.dart';
import 'package:game2048/src/widgets/end-game.widget.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('😭😭😭😭😭'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: const EndGameWidget(
            linkImage: "https://media.giphy.com/media/d2lcHJTG5Tscg/giphy.gif",
            endGameText: "🫵 Game Over!  🤪"));
  }
}
