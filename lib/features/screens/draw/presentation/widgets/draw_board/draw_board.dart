import 'package:flutter/material.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_helper.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/gaps.dart';
import '../../draw_screen_constants.dart';
import 'draw_board_content.dart';
import 'draw_board_header.dart';

class DrawBoard extends StatelessWidget {
  const DrawBoard({
    super.key,
    required this.ballNumbers,
  });
  final List<int> ballNumbers;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boardSectionHeight = DrawBoardHelper.calculateBoardSectionHeight(
            maxWidth: constraints.maxWidth,
            itemsCount: AppConstants.totalTicketNumber ~/ 2);
        final drawerHeaderLabelWidth =
            DrawScreenConstants.drawBoardLabelWidth + Gaps.spacing4;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: drawerHeaderLabelWidth,
                bottom: Gaps.spacing4,
              ),
              child: DrawBoardHeader(
                labelWidth: boardSectionHeight,
                ballNumbers: ballNumbers,
              ),
            ),
            DrawBoardContent(
              boardSectionHeight: boardSectionHeight,
              width: constraints.maxWidth,
              ballNumbers: ballNumbers,
            ),
          ],
        );
      },
    );
  }
}
