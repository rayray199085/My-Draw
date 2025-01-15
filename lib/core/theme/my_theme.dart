import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.black38,
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    splashColor: Colors.transparent,
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
              return Colors.white38;
            }
            return Colors.blueAccent;
          }),
          padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0), // Corner radius here
            ),
          ),
          textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(
            fontSize: 16.0,
          ))),
    ),
  );
}
