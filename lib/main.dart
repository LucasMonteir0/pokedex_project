import 'package:flutter/material.dart';
import 'package:pokedex_project/theme.dart';
import 'package:pokedex_project/view/home_page.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: PokeTheme.light(),
      home: const HomePage(),
    );
  }
}
