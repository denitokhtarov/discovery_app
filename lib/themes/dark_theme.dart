import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  canvasColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    inversePrimary: Colors.white,
    secondary: Colors.black,
    tertiary: Color.fromARGB(255, 255, 255, 255),
    onTertiary: Colors.white,
  ),
);
