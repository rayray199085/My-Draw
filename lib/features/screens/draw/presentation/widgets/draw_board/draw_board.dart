import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_helper.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/animated_ball_number_view.dart';

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
        final double cellWidth =
            DrawBoardHelper.getGridCellWidth(maxWidth: constraints.maxWidth);
        final cellHeight =
            cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;
        final gridSectionHeight = DrawBoardHelper.calculateGridSectionHeight(
            cellHeight: cellHeight, itemsCount: sectionItemCount);
        final gridViewHeight =
            gridSectionHeight * 2 + DrawScreenConstants.boardSectionVerticalGap;
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
              child: DrawBoardHeader(labelWidth: gridSectionHeight),
            ),
            SizedBox(
              height: gridViewHeight,
              child: Stack(
                children: [
                  Column(
                    spacing: DrawScreenConstants.boardSectionVerticalGap,
                    children: [
                      DrawBoardSection(
                        startingIndex: 0,
                        itemsCount: sectionItemCount,
                        sectionType: DrawBoardSectionType.heads,
                        height: gridSectionHeight,
                      ),
                      DrawBoardSection(
                        startingIndex: sectionItemCount,
                        itemsCount: sectionItemCount,
                        sectionType: DrawBoardSectionType.tails,
                        height: gridSectionHeight,
                      )
                    ],
                  ),
                  BlocSelector<DrawCubit, DrawState, int?>(
                    selector: (state) => state.maybeMap(
                        loaded: (loaded) => loaded.ballNumbers.lastOrNull,
                        orElse: () => null),
                    builder: (context, number) {
                      if (number != null) {
                        // final point =
                        //     DrawBoardHelper.getAnimationTargetPosition(
                        //   number: number,
                        //   gridSectionHeight: gridSectionHeight,
                        //   cellWidth: cellWidth,
                        //   cellHeight: cellHeight,
                        // );
                        final point =
                            DrawBoardHelper.getAnimationStartingPosition(
                                maxWidth: constraints.maxWidth,
                                gridViewHeight: gridViewHeight);
                        return Positioned(
                            top: point.dy.toDouble(),
                            left: point.dx.toDouble(),
                            child: AnimatedBallNumberView(number: number));
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
