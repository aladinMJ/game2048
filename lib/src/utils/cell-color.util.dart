import 'package:flutter/material.dart';

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
