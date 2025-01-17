import 'package:flutter/material.dart';
import 'package:my_draw/generated/l10n.dart';

class ScreenTestWrapper extends StatelessWidget {
  const ScreenTestWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: child,
    );
  }
}
