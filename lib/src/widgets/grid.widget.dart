import 'package:flutter/material.dart';

class GridGameWidget extends StatelessWidget {
  final List<List<int>> grid;

  GridGameWidget({super.key, required this.grid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int gridSize = grid.length;
    
    // Détermine la taille des cellules en fonction de la largeur de l'écran
    double cellSize = screenWidth / (gridSize + 2); // Ajuster ce ratio si nécessaire

    Color getCellColor(int number) {
      switch (number) {
        case 2:
          return const Color(0xFFEEE4DA);
        case 4:
          return const Color(0xFFEDE0C8);
        case 8:
          return const Color(0xFFF2B179);
        case 16:
          return const Color(0xFFF59563);
        case 32:
          return const Color(0xFFF67C5F);
        case 64:
          return const Color(0xFFF65E3B);
        case 128:
          return const Color(0xFFEDCF72);
        case 256:
          return const Color(0xFFEDCC61);
        case 512:
          return const Color(0xFFEDC850);
        case 1024:
          return const Color(0xFFEDC53F);
        case 2048:
          return const Color(0xFFEDC22E);
        default:
          return const Color(0xFFCDC1B4);
      }
    }

    double getCellFontSize(int number) {
      int length = number.toString().length;

      switch (length) {
        case 1:
          return cellSize * 0.5;
        case 2:
          return cellSize * 0.45;
        case 3:
          return cellSize * 0.4;
        case 4:
          return cellSize * 0.3;
        default:
          return cellSize * 0.2;
      }
    }

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      crossAxisCount: gridSize,
      children: List.generate(gridSize * gridSize, (index) {
        int row = (index / gridSize).floor();
        int col = index % gridSize;
        int value = grid[row][col];
        return Column(
          children: <Widget>[
            SizedBox(
              width: cellSize,
              height: cellSize,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: getCellColor(value),
                child: Center(
                  child: value == 0
                      ? const Text('')
                      : Text(
                          '$value',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getCellFontSize(value),
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
