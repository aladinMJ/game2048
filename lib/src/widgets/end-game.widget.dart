import 'package:flutter/material.dart';
import 'package:game2048/src/models/game.model.dart';
import 'package:game2048/src/widgets/custom-text.widget.dart';
import 'package:game2048/src/widgets/score.widget.dart';
import 'package:provider/provider.dart';

class EndGameWidget extends StatelessWidget {
  final String linkImage;
  final String endGameText;
  const EndGameWidget(
      {super.key, required this.linkImage, required this.endGameText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<GameModel>(
        builder: (context, GameModel gameModel, child) => Center(
                child: Center(
                    child: Column(
              mainAxisSize: MainAxisSize.min, // Limite la hauteur au contenu
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: CustomTextWidget(
                        text: endGameText,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold)),
                ScoreWidget(score: gameModel.score, label: "is your score"),
                Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Image.network(
                      linkImage,
                      height: screenHeight * 0.3,
                      fit: BoxFit.contain,
                    )),
              ],
            ))));
  }
}
