import 'package:flutter/material.dart';
import 'package:game2048/src/models/game.model.dart';
import 'package:localstorage/localstorage.dart';
import 'src/pages/home.page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  localStorage.setItem('bestScore', '0');
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameModel(size: 4),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '2048', routes: {
      '/': (context) => const HomePage(),
    });
  }
}
