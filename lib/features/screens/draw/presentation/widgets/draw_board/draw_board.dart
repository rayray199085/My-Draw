import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/animated_circle.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/gaps.dart';
import '../../draw_screen_constants.dart';
import 'draw_board_header.dart';
import 'draw_board_section.dart';

class DrawBoard extends StatelessWidget {
  const DrawBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItemCount = AppConstants.totalTicketNumber ~/ 2;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final gridSectionHeight = _calculateGridSectionHeight(
            maxWidth: constraints.maxWidth, itemsCount: sectionItemCount);
        final gridViewHeight = gridSectionHeight * 2 + Gaps.spacing16;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: DrawScreenConstants.drawBoardLabelWidth + Gaps.spacing4,
                bottom: Gaps.spacing4,
              ),
              child: DrawBoardHeader(labelWidth: gridSectionHeight),
            ),
            SizedBox(
              height: gridViewHeight,
              child: Stack(
                children: [
                  Column(
                    children: [
                      DrawBoardSection(
                        startingIndex: 0,
                        itemsCount: sectionItemCount,
                        sectionType: DrawBoardSectionType.heads,
                        height: gridSectionHeight,
                      ),
                      const SizedBox(height: Gaps.spacing16),
                      DrawBoardSection(
                        startingIndex: sectionItemCount,
                        itemsCount: sectionItemCount,
                        sectionType: DrawBoardSectionType.tails,
                        height: gridSectionHeight,
                      )
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left:
                        DrawScreenConstants.drawBoardLabelWidth + Gaps.spacing4,
                    child: BlocSelector<DrawCubit, DrawState, int?>(
                      selector: (state) => state.maybeMap(
                          loaded: (loaded) => loaded.ballNumbers.lastOrNull,
                          orElse: () => null),
                      builder: (context, number) {
                        return number != null
                            ? AnimatedCircle(number: number)
                            : const SizedBox.shrink();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateGridSectionHeight({
    required double maxWidth,
    required int itemsCount,
  }) {
    final double gridWidth = maxWidth - DrawScreenConstants.drawBoardLabelWidth;
    final double cellWidth =
        (gridWidth - DrawScreenConstants.boardCrossAxisCount * Gaps.spacing4) /
            DrawScreenConstants.boardCrossAxisCount;
    final cellHeight =
        cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;
    final rowCount = itemsCount / DrawScreenConstants.boardCrossAxisCount;
    final gridSectionHeight =
        cellHeight * rowCount + (rowCount - 1) * Gaps.spacing4;
    return gridSectionHeight;
  }
}
