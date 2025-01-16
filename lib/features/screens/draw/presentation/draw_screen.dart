import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board.dart';

import '../../../../generated/l10n.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).draw),
      ),
      body: const DrawBody(),
    );
  }
}

@visibleForTesting
class DrawBody extends StatelessWidget {
  const DrawBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Gaps.spacing16),
        child: DrawBoard(),
      ),
    ));
  }
}
