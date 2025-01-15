import 'package:flutter/material.dart';

class FullScreenModalPage<T> extends Page<T> {
  final Widget child;

  const FullScreenModalPage({required this.child, super.key});

  @override
  Route<T> createRoute(BuildContext context) => MaterialPageRoute<T>(
        settings: this,
        builder: (context) => child,
        fullscreenDialog: true,
      );
}
