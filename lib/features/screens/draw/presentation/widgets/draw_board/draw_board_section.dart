import 'package:flutter/material.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_section_color.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../../../../core/theme/gaps.dart';
import '../../../../../../generated/l10n.dart';
import '../../draw_screen_constants.dart';
import '../../enums/draw_board_section_type.dart';
import 'draw_board_section_cell.dart';

class DrawBoardSection extends StatelessWidget {
  const DrawBoardSection({
    super.key,
    this.startingIndex = 0,
    required this.itemsCount,
    required this.sectionType,
    required this.height,
  });

  final int startingIndex;
  final int itemsCount;
  final DrawBoardSectionType sectionType;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: height,
            width: DrawScreenConstants.drawBoardLabelWidth,
            child: DrawBoardSectionLabel(
              text: _sectionLabel,
              backgroundColor: getDrawBoardSectionPrimaryColor(
                  context: context, type: sectionType),
            )),
        const SizedBox(width: Gaps.spacing4),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DrawScreenConstants.boardCrossAxisCount,
              crossAxisSpacing: Gaps.spacing4,
              mainAxisSpacing: Gaps.spacing4,
              childAspectRatio:
                  DrawScreenConstants.drawBoardGridCellAspectRatio,
            ),
            itemCount: itemsCount,
            itemBuilder: (context, index) {
              final number = startingIndex + index + 1; // number = index + 1
              return DrawBoardSectionCell(number: number);
            },
          ),
        ),
      ],
    );
  }

  String get _sectionLabel {
    switch (sectionType) {
      case DrawBoardSectionType.heads:
        return S.current.heads;
      case DrawBoardSectionType.tails:
        return S.current.tails;
    }
  }
}
