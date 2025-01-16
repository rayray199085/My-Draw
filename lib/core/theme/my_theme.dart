import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/radius_values.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.black87,
      onSecondary: Colors.white,
      tertiary: Colors.red,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    // splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.5,
      shadowColor: Colors.grey,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.blue;
            } else if (states.contains(WidgetState.disabled)) {
              return Colors.black26;
            }
            return Colors.blueAccent;
          }),
          padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  RadiusValues.circular10), // Corner radius here
            ),
          ),
          textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(
            fontSize: 16.0,
          ))),
    ),
  );
}
