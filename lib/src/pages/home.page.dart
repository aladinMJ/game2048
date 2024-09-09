import 'package:flutter/material.dart';
import 'package:game2048/src/enums/SwipeType.enum.dart';
import 'package:game2048/src/models/game.model.dart';
import 'package:game2048/src/widgets/current-score.widget.dart';
import 'package:game2048/src/widgets/grid.widget.dart';
import 'package:game2048/src/widgets/swipe-detector.widget.dart';
import 'package:provider/provider.dart';
import '../widgets/game_lost.dart';
import '../widgets/game_win.dart';
import '../widgets/score.widget.dart';

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
  // HomePage({super.key }) {
  //   for (int i = 0; i < 4; i++) {
  //     // grid.add([0, 0, 0, 0]);
  //   }

  //   grid.add([0, 0, 0, 0]);
  //   grid.add([1, 0, 0, 0]);
  //   grid.add([0, 4, 0, 0]);
  //   grid.add([0, 0, 0, 5]);
  // }

  final int bestScore = 2048;

  // int currentScore = 0;
  List<List<int>> currentGrid = [];

  void handleGameWhileSwipingAndUpdateGrid(GameModel game, SwipeType swipe) {
    game.play(swipe);
    setState(() {
      currentGrid = game.grid;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   for (int i = 0; i < 4; i++) {
  //     // grid.add([0, 0, 0, 0]);
  //   }

  //   grid.add([0, 1024, 0, 0]);
  //   grid.add([2, 0, 0, 512]);
  //   grid.add([0, 256, 32, 0]);
  //   grid.add([0, 2048, 0, 4]);
  // }

  final List<List<int>> grid = [];

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
                  child: ElevatedButton(
                    onPressed: () {
                      gameGrid.initGridState();
                      setState(() {
                        currentGrid = gameGrid.grid;
                        // currentScore = gameGrid.score;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 0, 0, 0),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(screenWidth * 0.8, screenHeight * 0.08),
                        )),
                    child: const Text('RESTART',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
