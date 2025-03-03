import 'package:flutter/material.dart';

/// Default color for countdown cards
const Color defaultColor = Colors.blue;

/// Predefined colors for countdown cards
const List<Color> predefinedColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.pink,
];

/// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    elevation: 2,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  ),
);

/// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 2,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  ),
);

/// Format date as `dd-MM-yyyy`
/// Used for consistent date display across the app
String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.year}';
}

/// Default padding used across the app
const double defaultPadding = 16.0;
