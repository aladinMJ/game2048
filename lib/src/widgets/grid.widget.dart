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

    Color getCellColor(int number) {
      switch (number) {
        case 2:
          return const Color(0xFFEEE4DA); // Beige clair
        case 4:
          return const Color(0xFFEDE0C8); // Beige foncé
        case 8:
          return const Color(0xFFF2B179); // Orange clair
        case 16:
          return const Color(0xFFF59563); // Orange moyen
        case 32:
          return const Color(0xFFF67C5F); // Orange vif
        case 64:
          return const Color(0xFFF65E3B); // Rouge orangé
        case 128:
          return const Color(0xFFEDCF72); // Jaune doré
        case 256:
          return const Color(0xFFEDCC61); // Jaune doré plus intense
        case 512:
          return const Color(0xFFEDC850); // Jaune doré foncé
        case 1024:
          return const Color(0xFFEDC53F); // Jaune intense
        case 2048:
          return const Color(0xFFEDC22E); // Jaune vif
        default:
          return const Color(
              0xFFCDC1B4); // Gris clair (pour les cases vides ou valeurs au-delà de 2048)
      }
    }

    double getCellFontSize(int number) {
      int length =
          number.toString().length; // Nombre de chiffres dans le nombre

      switch (length) {
        case 1: // Pour un chiffre
          return 52.0;
        case 2: // Pour deux chiffres
          return 48.0;
        case 3: // Pour trois chiffres
          return 44.0;
        case 4: // Pour quatre chiffres
          return 36.0;
        default: // Pour cinq chiffres ou plus
          return 20.0;
      }
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
                    //color: Colors.black,
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
                  ))
            ],
          );
        }));
  }
}
