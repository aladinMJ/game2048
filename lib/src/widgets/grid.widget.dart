import 'package:flutter/material.dart';

class GridGameWidget extends StatelessWidget {
  final List<List<int>> grid;

  const GridGameWidget({super.key, required this.grid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int gridSize = grid.length;

    double cellSize = screenWidth / (gridSize + 1);

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
      int length =
          number.toString().length; // Nombre de chiffres dans le nombre

      switch (length) {
        case 1:
          return 52.0;
        case 2:
          return 48.0;
        case 3:
          return 44.0;
        case 4:
          return 36.0;
        default:
          return 32.0;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[600],
      ),
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: getCellColor(value),
                    ),
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
          })),
    );
  }
}
