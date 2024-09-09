import 'package:flutter/material.dart';
import 'package:game2048/src/widgets/end-game.widget.dart';

class GameWonPage extends StatelessWidget {
  const GameWonPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('🥳🥳🥳🥳🥳'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: const EndGameWidget(
            linkImage:
                "https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExcW82YXMwamE3MTZkeGZtb2ZnNjA4dmo0eHhweXNqNW0xbHQxdHhuYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JV7GuEriVvMk921YaA/giphy.gif",
            endGameText: "🎉 Won! 🎊"));
  }
}
