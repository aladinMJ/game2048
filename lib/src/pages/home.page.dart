import 'package:flutter/material.dart';
import 'package:game2048/src/widgets/grid.widget.dart';
import 'package:game2048/src/widgets/swipe-detector.widget.dart';
import '../widgets/score.widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    for (int i = 0; i < 4; i++) {
      // grid.add([0, 0, 0, 0]);
    }

    grid.add([0, 0, 0, 0]);
    grid.add([1, 0, 0, 0]);
    grid.add([0, 4, 0, 0]);
    grid.add([0, 0, 0, 5]);
  }

  final int bestScore = 2048;
  final int currentScore = 0;

  final List<List<int>> grid = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title:
              const Text('AA - 2 0 4 8 - PT', style: TextStyle(fontSize: 25)),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        body: SwipeDetector(
          onSwipeLeft: () {
            print('swipe left');
          },
          onSwipeRight: () {
            print('swipe right');
          },
          onSwipeUp: () {
            print('swipe up');
          },
          onSwipeDown: () {
            print('swipe down');
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ScoreWidget(
                    score: currentScore,
                    label: "Current Score",
                  ),
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
                child: GridGameWidget(
                  grid: grid,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 0, 0, 0),
                        ),
                        minimumSize: WidgetStateProperty.all<Size>(
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
        ));
  }
}
