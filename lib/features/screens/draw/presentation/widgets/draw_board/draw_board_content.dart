import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../cubit/draw_cubit.dart';
import '../../draw_screen_constants.dart';
import '../../enums/draw_board_section_type.dart';
import '../../utils/draw_board_helper.dart';
import '../animated_ball_number_view.dart';
import 'draw_board_section.dart';

class DrawBoardContent extends StatelessWidget {
  const DrawBoardContent({
    super.key,
    required this.gridSectionHeight,
    required this.width,
  });

  final double gridSectionHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    final sectionItemCount = AppConstants.totalTicketNumber ~/ 2;
    final gridViewHeight =
        gridSectionHeight * 2 + DrawScreenConstants.boardSectionVerticalGap;
    return SizedBox(
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
                final point = DrawBoardHelper.getAnimationStartingPosition(
                    maxWidth: width, gridViewHeight: gridViewHeight);
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
    );
  }
}
