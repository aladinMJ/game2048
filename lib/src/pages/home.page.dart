import 'package:flutter/material.dart';
import 'package:game2048/src/enums/swipe-type.enum.dart';
import 'package:game2048/src/models/game.model.dart';
import 'package:game2048/src/pages/game-over.page.dart';
import 'package:game2048/src/pages/game-won.page.dart';
import 'package:game2048/src/widgets/current-score.widget.dart';
import 'package:game2048/src/widgets/custom-button.widget.dart';
import 'package:game2048/src/widgets/grid.widget.dart';
import 'package:game2048/src/widgets/score.widget.dart';
import 'package:game2048/src/widgets/swipe-detector.widget.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int bestScore = 0;
  List<List<int>> currentGrid = [];

  void handleGameWhileSwipingAndUpdateGrid(GameModel game, SwipeType swipe) {
    game.play(swipe);
    setState(() {
      currentGrid = game.grid;
      if (game.score >= bestScore) {
        bestScore = game.score;
        localStorage.setItem('bestScore', bestScore.toString());
      }
    });

    if (game.isGameWon == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const GameWonPage(),
      ));
    } else if (game.isGameWon == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const GameOverPage(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    bestScore = int.parse(localStorage.getItem('bestScore')!);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('2 0 4 8', style: TextStyle(fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Consumer<GameModel>(builder: (context, gameGrid, child) {
        return SwipeDetector(
          onSwipeLeft: () {
            handleGameWhileSwipingAndUpdateGrid(gameGrid, SwipeType.left);
          },
          onSwipeRight: () {
            handleGameWhileSwipingAndUpdateGrid(gameGrid, SwipeType.right);
          },
          onSwipeUp: () {
            handleGameWhileSwipingAndUpdateGrid(gameGrid, SwipeType.up);
          },
          onSwipeDown: () {
            handleGameWhileSwipingAndUpdateGrid(gameGrid, SwipeType.down);
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: CurrentScoreWidget(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ScoreWidget(score: bestScore, label: 'Best Score'),
                ),
              ),
              Center(
                child: GridGameWidget(grid: gameGrid.grid),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: CustomButtonWidget(
                      label: "RESTART",
                      onPressed: () {
                        gameGrid.initGridState();
                        setState(() {
                          currentGrid = gameGrid.grid;
                        });
                      }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
