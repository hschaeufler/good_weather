import 'package:flutter/material.dart';

class CustomWeatherTheme {
  static ThemeData get light {
    return ThemeData(
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
        ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          decorationColor: Colors.white,
        ));
  }
}
