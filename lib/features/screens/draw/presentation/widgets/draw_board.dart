import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/gaps.dart';
import 'draw_board_section.dart';

class DrawBoard extends StatelessWidget {
  const DrawBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItemCount = AppConstants.totalTicketNumber ~/ 2;
    return Column(
      children: [
        DrawBoardSection(
          startingIndex: 0,
          itemsCount: sectionItemCount,
          sectionType: DrawBordSectionType.heads,
        ),
        const SizedBox(height: Gaps.spacing16),
        DrawBoardSection(
          startingIndex: sectionItemCount,
          itemsCount: sectionItemCount,
          sectionType: DrawBordSectionType.tails,
        )
      ],
    );
  }
}
