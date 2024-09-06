import 'package:flutter/material.dart';

class GridGameWidget extends StatelessWidget {
  List<List<int>> grid;

  GridGameWidget({super.key, required this.grid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int gridSize = grid.length;
    double ratio;
    if (gridSize == 4) {
      ratio = 0.040;
    } else if (5 <= gridSize && gridSize < 7) {
      ratio = 0.020;
    } else {
      ratio = 0.001;
    }

    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        //mainAxisSpacing: screenWidth * 0.0125,

        crossAxisCount: grid.length,
        children: List.generate(grid.length * grid.length, (index) {
          int row = (index / gridSize).floor();
          int col = index % gridSize;
          int value = grid[row][col];
          return Column(
            children: <Widget>[
              // MyButton(myValue: g.listCells[lig][col], myColor: color),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '$value',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ))
            ],
          );
        }));
  }
}
