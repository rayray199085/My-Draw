import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_helper.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/gaps.dart';
import '../../cubit/draw_cubit.dart';
import '../../draw_screen_constants.dart';
import 'draw_board_content.dart';
import 'draw_board_header.dart';

class DrawBoard extends StatelessWidget {
  const DrawBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItemCount = AppConstants.totalTicketNumber ~/ 2;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final gridSectionHeight = DrawBoardHelper.calculateGridSectionHeight(
            maxWidth: constraints.maxWidth, itemsCount: sectionItemCount);
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
            BlocSelector<DrawCubit, DrawState, int?>(
              selector: (state) => state.maybeMap(
                  loaded: (loaded) => loaded.ballNumbers.lastOrNull,
                  orElse: () => null),
              builder: (context, number) {
                return DrawBoardContent(
                  gridSectionHeight: gridSectionHeight,
                  width: constraints.maxWidth,
                  number: number,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
