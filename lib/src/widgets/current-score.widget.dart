import 'package:flutter/material.dart';
import 'package:game2048/src/models/game.model.dart';
import 'package:game2048/src/widgets/score.widget.dart';
import 'package:provider/provider.dart';

class CurrentScoreWidget extends StatelessWidget {
  const CurrentScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, GameModel gameModel, child) =>
            ScoreWidget(score: gameModel.score, label: 'Current Score'));
  }
}
