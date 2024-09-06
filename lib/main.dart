import 'package:flutter/material.dart';
import 'src/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFD1866F, {
          50: Color(0xFFFFF3F0),
          100: Color(0xFFFFE0D9),
          200: Color(0xFFFFCBBF),
          300: Color(0xFFFFB6A5),
          400: Color(0xFFFFA18C),
          500: Color(0xFFD1866F),
          600: Color(0xFFA96C55),
          700: Color(0xFF81523C),
          800: Color(0xFF593822),
          900: Color(0xFF301409),
        }),
      ),
      home: HomePage(),
    );
  }
}
