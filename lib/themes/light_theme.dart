import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  canvasColor: Colors.white,
  colorScheme: const ColorScheme.light(
    inversePrimary: Colors.black,
    secondary: Colors.black,
    tertiary: Color.fromARGB(255, 240, 240, 240),
    onTertiary: Color.fromARGB(255, 223, 223, 223),
  ),
);
