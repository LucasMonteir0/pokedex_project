import 'package:flutter/material.dart';
import 'package:pokedex_project/config/colors.dart';

class PokeTheme {
  static ThemeData light() {
    return ThemeData(
      // TEXT EDITING

      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),

      // SCAFFOLD EDITING

      scaffoldBackgroundColor: PokeColor.scaffoldBackground,
      appBarTheme: const AppBarTheme(
        color: PokeColor.scaffoldBackground,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: PokeColor.primary,
            fontSize: 30,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
