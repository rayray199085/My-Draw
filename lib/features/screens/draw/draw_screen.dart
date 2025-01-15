import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).draw),
      ),
    );
  }
}
