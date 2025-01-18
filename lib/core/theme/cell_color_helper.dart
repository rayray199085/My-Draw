import 'package:flutter/material.dart';

class CellColorHelper {
  static Color getCellBackgroundColor({required int number}) {
    switch (number) {
      case var n when (n >= 1 && n <= 10):
        return Colors.red;
      case var n when (n >= 11 && n <= 20):
        return Colors.blue;
      case var n when (n >= 21 && n <= 30):
        return Colors.green;
      case var n when (n >= 31 && n <= 40):
        return Colors.orange;
      case var n when (n >= 41 && n <= 50):
        return Colors.purple;
      case var n when (n >= 51 && n <= 60):
        return Colors.redAccent;
      case var n when (n >= 61 && n <= 70):
        return Colors.grey;
      case var n when (n >= 71 && n <= 80):
        return Colors.deepPurple;
      default:
        return Colors.black;
    }
  }
}
