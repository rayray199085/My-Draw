import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/gaps.dart';
import '../../enums/draw_board_section_type.dart';
import 'draw_board_header_label.dart';

class DrawBoardHeader extends StatelessWidget {
  const DrawBoardHeader({
    super.key,
    required this.labelWidth,
    required this.ballNumbers,
  });
  final double labelWidth;
  final List<int> ballNumbers;

  @override
  Widget build(BuildContext context) {
    final tailsCount = ballNumbers
        .where((number) => number > AppConstants.totalTicketNumber ~/ 2)
        .length;
    final headCount = ballNumbers.length - tailsCount;
    return Row(
      spacing: Gaps.spacing16,
      children: [
        DrawBoardHeaderLabel(
          type: DrawBoardSectionType.heads,
          width: labelWidth,
          count: headCount,
        ),
        DrawBoardHeaderLabel(
          type: DrawBoardSectionType.tails,
          width: labelWidth,
          count: tailsCount,
        ),
      ],
    );
  }
}
